function [ diff_matr ] = get_differential_matrix( sampling_points, degree )
%GET_DIFFERENTIAL_MATRIX Calculate Matrix for first derivative of
%polynomial
%   Use timestamps t_i to calculate (p+1)*t_i^p for every desired
%   polynomial degree p

assert(isvector(sampling_points), 'Sampling points must be saved in (one-dimensional) vector');
if (degree > length(sampling_points))
    warning('For regression, the degrees of freedom should be fewer than the conditions.');
end

% One row for every timestamp
rows = length(sampling_points);
% Remember the intercept
columns = degree + 1;

% Initiate matrix with zeros, since first column contains only zeros
% (exists only to keep dimensions consistent).
diff_matr = zeros(rows, columns);

% Second column only contains ones
diff_matr(:, 2) = ones(rows, 1);

% Calculate every other value
for row = 1:rows
    for column = 3:columns
        diff_matr(row, column) = (column - 1) * sampling_points(row)^(column - 2);
    end
end

end
