function [ times, values ] = remove_nans( times, values )
%REMOVE_NANS Remove NaN values from data

indices_with_nan = find(isnan(values));
times(indices_with_nan) = [];
values(indices_with_nan) = [];

end

