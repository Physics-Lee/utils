% flip labels
%
% Yixuan Li, 2024-04-29
%

% Define a function that updates the 'label' column in machine_label
function updated_machine_label = flip_labels(is_swapped_checked, machine_label)
    % Initialize the updated_machine_label with the original machine_label
    updated_machine_label = machine_label;

    % Loop through the is_swapped_checked table and find the TRUE ranges
    for i = 1:height(is_swapped_checked)
        if is_swapped_checked.Is_Swapped(i) == "TRUE"
            % Identify machine_label rows that fall within the current true range
            in_range = machine_label.start_frame >= is_swapped_checked.start_frame(i) & ...
                       machine_label.end_frame <= is_swapped_checked.end_frame(i);

            % Flip 'forward' and 'reversal' for those rows
            updated_machine_label.label(in_range) = cellfun(@flip_label, machine_label.label(in_range), 'UniformOutput', false);
        end
    end
end

% Helper function to flip the labels
function new_label = flip_label(label)
    if strcmp(label, 'forward')
        new_label = 'reversal';
    elseif strcmp(label, 'reversal')
        new_label = 'forward';
    else
        new_label = label;
    end
end