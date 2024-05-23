clear;clc;close all;

dbstop if error;

root_path = uigetdir;
if root_path ~= 0
    list = get_all_files_of_a_certain_type_in_a_rootpath(root_path,'*_Are_the_Head_and_the_Tail_Swapped_CHECKED.csv');
    if size(list,1) ~= 0
        [indx,tf] = listdlg('ListString',list,'ListSize',[800,600],'Name','Choose files to convert');
        if tf==1
            for i = indx

                %% read Is_Swapped_CHECKED.csv
                full_path_to_Is_Swapped = list{i};
                Is_Swapped_CHECKED = readtable(full_path_to_Is_Swapped);

                % remove missing
                Is_Swapped_CHECKED = rmmissing(Is_Swapped_CHECKED);

                %% read machine_label.csv
                [folder_path_to_mcd,file_name_of_Is_Swapped] = fileparts(full_path_to_Is_Swapped);
                folder_name_of_machine_label = strrep(file_name_of_Is_Swapped,"Are_the_Head_and_the_Tail_Swapped_CHECKED","machine_label");
                folder_path_to_machine_label = fullfile(folder_path_to_mcd,folder_name_of_machine_label);
                file_name_of_machine_label = "machine_label_frame_window_10.csv";
                full_path_to_machine_label = fullfile(folder_path_to_machine_label,file_name_of_machine_label);
                machine_label = readtable(full_path_to_machine_label);

                %% swap forward and reversal
                machine_label_CHECKED = flip_labels(Is_Swapped_CHECKED, machine_label);

                %% save as machine_label_CHECKED.csv
                full_path_of_machine_label_CHECKED = strrep(full_path_to_machine_label,".csv","_CHECKED.csv");
                writetable(machine_label_CHECKED,full_path_of_machine_label_CHECKED);

            end
        end
    end
end
disp("<<<END>>>")