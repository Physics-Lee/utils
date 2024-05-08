function curvature = calculate_the_curvature(coords)

% Calculate the curvature using the angle difference method.
% 
% Parameters:
%   - coords (Nx2 double): Array containing the x and y coordinates of the curve.
%
% Returns:
%   - curvature (Nx1 double): Array representing the curvature at each segment of the curve.
%
% Tips:
%   - The calculated value is actually curvature multiplied ds, that is, dtheta, not dtheta/ds.
%   - Here, we use atan2 with unwrap. If u use atan, u have to use unwrap(,pi/2).
%
% Author:
%   - Yixuan Li, 2024-05-08
%
% Contact:
%   - yixuanli@mail.ustc.edu.cn or bruce.yixuan.li@gmail.com
%

df = diff(coords, 1, 1);
theta = atan2(df(:,2), df(:,1));
curvature = diff(unwrap(theta), 1);

end