clear

% These are around the same points as in the manuscript
timestamps = [40, 95, 105, 110, 112, 116, 118, 125, 130, 135, 200, 260, 263, 271, 277, 280, 281, 283, 292, 305, 320];
ndvi_values = 1/100 * [43, 55, 5, 73, 72, 82, 85, 79, 81, 84, 70, 62, 59, 66, 64, 67, 66, 65, 63, 67, 61];

% Change these parameters for testing
degree = 6;
regularization_factor = 10;
extra_points = int32([linspace(0, 40, 20), linspace(320, 365, 25)]);
%extra_points = [min(timestamps), max(timestamps)];

% Do the regression
coefficients = polynomial_regression(timestamps, ndvi_values, degree, regularization_factor, extra_points);

% Plot result
scatter(timestamps, ndvi_values)
hold on
fplot(@(x) polyval(fliplr(coefficients'), x), single([min(extra_points), max(extra_points)]))
hold off