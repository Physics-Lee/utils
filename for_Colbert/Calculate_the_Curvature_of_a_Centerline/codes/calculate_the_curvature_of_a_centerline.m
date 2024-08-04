function curvature_of_centerline = calculate_the_curvature_of_a_centerline(centerline)

% Calculates the curvature of a centerline.
%
% Parameters:
%   - centerline (2x100 double): Numerical array of x and y coordinates.
%
% Returns:
%   - curvature_of_centerline (100x1 double): Array of curvature values.
%
% Tips:
%   - It is recommended to rescale the input coordinates to ensure they have at least 
%   the magnitude of 10 to avoid precision issues during spline
%   smoothing. It is recommended to use centerlines in the relative frame,
%   which have the magnitude of 100.
%
% Author:
%   - Yixuan Li, 2024-05-08
%
% Contact:
%   - yixuanli@mail.ustc.edu.cn or bruce.yixuan.li@gmail.com
%

%% Perform spline fitting
d = calculate_distances(centerline);
centerline_fitted = perform_spline_smoothing(centerline, d);

%% Perform linear interpolation
d_smoothed = calculate_distances(centerline_fitted);
centerline_interpolated = perform_linear_interpolation(centerline_fitted, d_smoothed)';

%% Calculate curvature from the interpolated centerline
curvature_of_centerline = calculate_the_curvature(centerline_interpolated');

end