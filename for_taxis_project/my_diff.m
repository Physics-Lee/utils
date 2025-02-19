% return theta_2 - theta_1
% theta_2 is a number
%
% Think About Geometry, this function is asking, rotate how much to get theta_2
% from theta_1? And this "how much" belongs to [-pi, +pi].
%
% This function is equal to `diff = mod(theta_in - theta_ideal + pi, 2*pi)
% - pi;`
%
% 2023-09-28, Yixuan Li
%

function delta_theta = my_diff(theta_1,theta_2)

threshold = pi;
if abs(theta_2 - theta_1) <= threshold
    delta_theta = theta_2 - theta_1;
elseif theta_2 - theta_1 > threshold
    delta_theta = (theta_2 - theta_1) - 2*pi;
elseif theta_2 - theta_1 < -threshold
    delta_theta = (theta_2 - theta_1) + 2*pi;
end

end