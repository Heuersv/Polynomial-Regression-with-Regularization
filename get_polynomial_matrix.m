function [ poly_matr ] = get_polynomial_matrix( sampling_points, degree )
%GET_POLYNOMIAL_MATRIX Calculate Matrix A in Ax=b for polynomial regression
%   Use timestamps t_i to calculate t_i^p for every desired polynomial
%   degree p

assert(isvector(sampling_points), 'Sampling points must be saved in (one-dimensional) vector');
if (degree > length(sampling_points))
    warning('For regression, the degrees of freedom should be fewer than the conditions.');
end

% One row for every timestamp
rows = length(sampling_points);
% Remember the intercept
columns = degree + 1;

% Initiate matrix with ones, since first column contains only ones
poly_matr = ones(rows, columns);

% Calculate every value
for row = 1:rows
    for column = 2:columns
        poly_matr(row, column) = sampling_points(row)^(column - 1);
    end
end

end

