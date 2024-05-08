function curvature_of_centerline = calculate_the_curvature_of_a_centerline_v2(centerline,idx,is_perfect_function)

    % Calculates the curvature of a centerline.
    % Input: a 2x100 numerical array where rows are x and y coordinates.
    % Output: a 100x1 numerical array of curvature values.
    %
    % 2024-05-08, Yixuan Li.
    %
    
    %% Calculate distances along the centerline
    d = calculate_distances(centerline);
    
    %% Perform cubic smoothing spline interpolation
    centerline_splined = perform_spline_interpolation(centerline, d);
    d_splined = calculate_distances(centerline_splined);
    
    %% Perform linear interpolation on the smoothed centerline
    centerline_interpolated = perform_linear_interpolation(centerline_splined, d_splined);
    centerline_interpolated = centerline_interpolated';
    
    %% Calculate curvature from the interpolated centerline
    curvature_of_centerline = calculate_curvature(centerline_interpolated');
    
    %% for test
    if nargin >= 2
        plot_to_test(idx, centerline, centerline_splined, centerline_interpolated);
    end
    
    if nargin >= 3
        curvature_of_centerline = calculate_curvature(centerline');
    end
    
    end
    
    function d = calculate_distances(coords)
    
    % Calculate cumulative distances along a series of points.
    %
    % The calculated d will be used as parameter later.
    %
    
    df = diff(coords, 1, 2);
    d = cumsum([0, sqrt(sum(df.^2, 1))]);
    
    end
    
    function centerline_smoothed = perform_spline_interpolation(coords, d)
    
    % Perform cubic spline interpolation on a set of coordinates.
    %
    % Parameterize the curve. i.e., create x(d) and y(d) to do interpolation.
    %
    % The result WILL NOT pass all the original data points.
    %
    % P.S.: this method can remove noise.
    %
    
    spline_p = 0.0005;
    f = csaps(d, coords, spline_p);
    centerline_smoothed = fnval(f, d);
    end
    
    function centerline_interpolated = perform_linear_interpolation(coords, d)
    
    % Perform linear interpolation on the smoothed centerline.
    %
    % Parameterize the curve. i.e., create x(d) and y(d) to do interpolation.
    %
    % The result WILL pass all the original data points.
    %
    % P.S.: 
    % if u ask, then the result will pass all the original points. if
    % not, the result will only pass all points that u asked.
    %
    % TIPS:
    %   - add 0.00001*(0:length(d)-1) to make sure that each d is unique
    %   - use n_curvpts + 2 to make sure we get curvature of (n_curvpts,1)
    %
    
    n_curvpts = 100;
    d_max = d(end);
    centerline_interpolated = interp1(d + 0.00001*(0:length(d)-1), coords', ...
        linspace(0, d_max - 1, n_curvpts + 2)); 
    end
    
    function curvature = calculate_curvature(coords)
    
    % Calculate curvature using the angle change method.
    %
    % Here, we use atan2 with unwrap. If u use atan, u have to use
    % unwrap(,pi/2)
    %
    
    df = diff(coords, 1, 1);
    theta = atan2(df(:,2), df(:,1));
    curvature = diff(unwrap(theta), 1);
    
    end