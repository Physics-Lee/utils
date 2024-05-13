function centerline_smoothed = perform_spline_smoothing(coords, d)

% Performs cubic spline smoothing on a curve.
%
% Parameters:
%   - coords (Nx2 double): Array containing the x and y coordinates.
%   - d (Nx1 double): Parameterization vector for the coordinates, typically
%                      representing the arc length along the curve.
%
% Returns:
%   - centerline_smoothed (Nx2 double): Smoothed coordinates obtained from the
%                                       cubic spline interpolation.
%
% Tips:
%   - The result WILL NOT pass all the original data points.
%   - The spline smoothing parameter 'spline_p' is set to 0.0005. Adjust this value
%     to modify the smoothing effect.
%
% Author:
%   - Yixuan Li, 2024-05-08
%
% Contact:
%   - yixuanli@mail.ustc.edu.cn or bruce.yixuan.li@gmail.com
%

spline_p = 0.0005;
f = csaps(d, coords, spline_p);
centerline_smoothed = fnval(f, d);

end