function centerline_interpolated = perform_linear_interpolation(coords, d)

% Performs linear interpolation on a curve.
%
% Parameters:
%   - coords (Nx2 double): Array containing the x and y coordinates.
%   - d (Nx1 double): Parameterization vector for the coordinates, adjusted to 
%                      ensure uniqueness by adding a small increment.
%
% Returns:
%   - centerline_interpolated (n_curvpts+2)x2 double: Interpolated coordinates.
%
% Tips:
%   - The result WILL pass all the original data points.
%   - Add 0.00001*(0:length(d)-1) to the parameter vector 'd' to ensure each value
%     is unique, which is crucial for interpolation.
%   - Use 'n_curvpts + 2' to ensure the curvature can be computed at n_curvpts points.
%
% Author:
%   - Yixuan Li, 2024-05-08
%
% Contact:
%   - yixuanli@mail.ustc.edu.cn or bruce.yixuan.li@gmail.com
%

n_curvpts = 100;
d_max = d(end);
centerline_interpolated = interp1(d + 0.00001*(0:length(d)-1), coords', ...
    linspace(0, d_max - 1, n_curvpts + 2));

end