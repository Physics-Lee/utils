% Get all centerline (mm) in the relative reference frame of a single mcd.mat.
%
% 2024-05-08, Yixuan Li
%

function all_centerline = get_all_centerlines_in_relative_frame(mcd,flag_method)

n_frames = length(mcd);
all_centerline = cell(n_frames,1);
for i = 1:n_frames
    switch flag_method
        case "online"
            centerline = reshape(mcd(i).SegmentedCenterline,2,100);
        case "offline"
            centerline = reshape(0.5 * (mcd(i).BoundaryA + mcd(i).BoundaryB),2,100);
    end
    all_centerline{i,1} = centerline;    
end

end