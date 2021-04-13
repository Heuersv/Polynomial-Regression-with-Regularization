function [ results ] = process_file( filename, max_degree, reg_factor )
%PROCESS_FILE Takes a csv file and does regression on every row

% This import takes quite a lot of time and only works on the given data
% (with a consistant number of columns).
% There is no file with more than 1300 columns.
data = importfile(filename, 1, 1300);

% Initiate result matrix with zeros in case the polynomial degree is lower
% than max_degree
results = zeros(length(data(:,1)) - 1, max_degree + 1);

for row = 2:length(data(:,1))
    % Remove incomplete data points
    [timestamps, values] = remove_nans(data(1,:), data(row,:));
    % Determine polynomial degree depending on number of sampling points
    % left.
    degree = max(min(6, length(timestamps) - 2), 1);
    % Extra points for regularization.
    extra_points = int32([0:3:min(timestamps), max(timestamps):3:365]);
    % Calculate weights depending on timestamps
    weights = get_weights(timestamps);
    
    % Get coefficients
    coefficients = polynomial_regression(timestamps, values, degree, reg_factor, extra_points, weights);
    
    % Write coefficients to result matrix
    results(row-1, 1:degree+1) = coefficients';
end
