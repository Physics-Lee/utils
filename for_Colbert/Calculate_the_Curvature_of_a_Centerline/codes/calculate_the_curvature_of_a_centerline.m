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

%% Calculate distances along the centerline
d = calculate_distances(centerline);

%% Perform spline smooth
centerline_smoothed = perform_spline_smoothing(centerline, d);
d_smoothed = calculate_distances(centerline_smoothed);

%% Perform linear interpolation
centerline_interpolated = perform_linear_interpolation(centerline_smoothed, d_smoothed);
centerline_interpolated = centerline_interpolated';

%% Calculate curvature from the interpolated centerline
curvature_of_centerline = calculate_the_curvature(centerline_interpolated');

end