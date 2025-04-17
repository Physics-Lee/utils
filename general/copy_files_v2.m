input_folder_path = "D:\Nut_Cloud\high throughout system\data";
output_folder_path = "D:\Nut_Cloud\Worm-Thermo-Chemotaxis\Data\all_displacement_big_platform";
file_type = "all_disp_of_track_*.mat";

% choose the source folder to analyze
src_path = uigetdir(input_folder_path, 'Choose the source folder');

% if the user chooses a source folder
if src_path ~= 0

    % get full paths of files
    list = get_all_files_of_a_certain_name_pattern_in_a_rootpath(src_path, file_type);

    % if empty
    if isempty(list)
        msgbox("No file type like that in your source folder.", 'Info', 'help');
        return;
    end

    % choose files
    [indx, tf] = listdlg('ListString', list, 'ListSize', [800, 600], 'Name', 'Choose files');

    % loop to process each file
    for i = indx
        dest_path = strrep(list{i},input_folder_path,output_folder_path);
        create_folder(fileparts(dest_path))
        copyfile(list{i}, dest_path); % core
    end
end