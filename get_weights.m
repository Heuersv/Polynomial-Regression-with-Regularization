function [ weights ] = get_weights( sampling_points, summer_factor )
%GET_WEIGHTS Calculate weights depending on given timestamps
%   We use smaller weights, if there are other points nearby

weights = ones(length(sampling_points), 1);
for i = 2:length(weights)-1
    weights(i) = sampling_points(i+1) - sampling_points(i-1);
end
% Edge cases
weights(1) = 2 * (sampling_points(2) - sampling_points(1));
weights(end) = 2 * (sampling_points(end) - sampling_points(end-1));

% Change weights depending on time of year
for i = 1:length(weights)
    weights(i) = weights(i) + summer_factor * (365/2 - abs(sampling_points(i)-365/2));
end

% Normalize
% weights = weights/max(weights);

end

