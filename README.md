# Polynomic Regression with Regularization
Using polynomial regression with regularization for preprocessing Sentinel-2 data to predict land-use intensities in graslands.

## Usage
The coefficients for the resulting polynom are calculated in `polynomial_regression.m`.
An example file for testing is provided in `test_regression.m`.

To do this regression on all files in given folders, change the parameters in `all_regressions.m` and run this script.
To get the coefficients for a single file, use the `process_file.m` function.

## Remarks
The regularization "punishes" high derivatives of the polynomial at extra points outside the given sampling points.
