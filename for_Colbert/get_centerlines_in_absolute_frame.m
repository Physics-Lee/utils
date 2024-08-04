% Get centerlines after unit conversion and add stage position
%
% 2023-10-13, Yixuan Li
%

function [centerlines_lab,boundary_A_lab,boundary_B_lab] = get_centerlines_in_absolute_frame(mcd,start_frame,end_frame)

n_frames = end_frame - start_frame + 1;
centerlines_lab = cell(n_frames,1);
boundary_A_lab = cell(n_frames,1);
boundary_B_lab = cell(n_frames,1);
count = 0;
for i = start_frame:end_frame
    count = count + 1;
    centerlines_lab{count,1} = convert_coordinates_and_add_stage_position(0.5*(mcd(i).BoundaryA+mcd(i).BoundaryB), mcd(i).StagePosition);
    boundary_A_lab{count,1} = convert_coordinates_and_add_stage_position(mcd(i).BoundaryA, mcd(i).StagePosition);
    boundary_B_lab{count,1} = convert_coordinates_and_add_stage_position(mcd(i).BoundaryB, mcd(i).StagePosition);
end

end