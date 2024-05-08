function d = calculate_distances(coords)

% Calculate cumulative distances along a series of points, which will be used to
% parameterize the centerline later.
%
% Yixuan Li, 2024-05-08 
%

df = diff(coords, 1, 2);
d = cumsum([0, sqrt(sum(df.^2, 1))]);

end