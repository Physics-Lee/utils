function label_rearranged = anti_output_label(table_from_csv, add_1)

% Function to convert label data from an Excel file to a numeric array format.
% Input:
%   data - a table containing the data with labels.
%   add_1 - a boolean flag indicating whether to add 1 to the first two columns of the numeric array.
% Output:
%   label - a numeric array with rearranged labels.

% Check for errors in the input data
check_error(table_from_csv);

% Convert the 'label' column to categorical type
T = table_from_csv;
T.label = categorical(T.label);

% Rename categories
T.label = rename_categories(T.label);

% Convert categorical labels to numeric array
T.label = str2double(cellstr(T.label));
label_rearranged = table2array(T);

% Add 1 to the first two columns if add_1 is true
if add_1
    label_rearranged(:, 1:2) = label_rearranged(:, 1:2) + 1;
end

end