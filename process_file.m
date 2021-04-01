function [ results ] = process_file( filename, max_degree, reg_factor )
%PROCESS_FILE Takes a csv file and does regression on every row

data = importfile(filename, 1, 1300);
regularization_factor = reg_factor;

results = zeros(length(data(:,1)) - 1, max_degree + 1);

for row = 2:length(data(:,1))
    [timestamps, values] = remove_nans(data(1,:), data(row,:));
    degree = max(min(6, length(timestamps) - 2), 1);
    extra_points = int32([0:3:min(timestamps), max(timestamps):3:365]);
    
    coefficients = polynomial_regression(timestamps, values, degree, regularization_factor, extra_points);
    
    results(row-1, 1:degree+1) = coefficients';
end
