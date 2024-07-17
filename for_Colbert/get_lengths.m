% Get lengths (mm) of all centerline of a single mcd.mat.
%
% 2023-10-13, Yixuan Li
%

function lengths_of_centerlines = get_lengths(centerlines_lab)
n_frames = length(centerlines_lab);
lengths_of_centerlines = zeros(n_frames,1);
for i = 1:n_frames
    centerline = centerlines_lab{i,1};
    lengths_of_centerlines(i) = calculate_the_length_of_a_centerline(centerline);
end
end