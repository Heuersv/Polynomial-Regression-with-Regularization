# Polynomic Regression with Regularization
Using polynomial regression with regularization for preprocessing Sentinel-2 data to predict land-use intensities in graslands.

## Usage
The coefficients for the resulting polynom are calculated in `polynomial_regression.m`.
An example file for testing is provided in `test_regression.m`.

## Remarks
The regularization "punishes" high derivatives of the polynomial at the sampling points and at extra points given by the user.
