function [ coefficients ] = polynomial_regression( sampling_points, sampling_values, degree, regularization_factor, extra_points )
%POLYNOMIAL_REGRESSION Compute polynom to fit given measurements
%   Allows for regularization with a penalty for high derivatives at the
%   sampling points.

% Checks
assert(isvector(sampling_points), 'Sampling points must be saved in (one-dimensional) vector.');
assert(isvector(sampling_values), 'Sampling values must be saved in (one-dimensional) vector.');
assert(length(sampling_points) == length(sampling_values), 'Not the same number of sampling points as sampling values.');
assert(degree < length(sampling_points), 'Degree to high, would interpolate instead of doing a regression.')

% Needed matrices
poly_matr = get_polynomial_matrix(sampling_points, degree);
diff_matr = get_differential_matrix(sampling_points, extra_points, degree);

% Sampling Values must be saved in column, not row
if (length(sampling_values(1, :)) > 1)
    sampling_values = sampling_values';
end

% Solve equaltion
coefficients = (poly_matr' * poly_matr + regularization_factor * (diff_matr' * diff_matr)) \ (poly_matr' * sampling_values);

end

