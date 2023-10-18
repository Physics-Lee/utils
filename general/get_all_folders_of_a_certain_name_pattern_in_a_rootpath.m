% get all folders of a certain name pattern in a rootpath and its sub-folders.
%
% 2023-10-07, Yixuan Li (Modified by ChatGPT)
%

function list = get_all_folders_of_a_certain_name_pattern_in_a_rootpath(rootpath, folder_pattern)

% Obtain all the subfolders recursively
folders = string(split(genpath(rootpath), pathsep));
folders = folders(1:length(folders)-1);

% Initialize an empty cell array to hold folder names
list = {};

% Convert string array to cell array for the loop
folders = cellstr(folders);

% Loop over all folders
for i = 1:length(folders)
    % Get a list of all items in the folder
    allItems = dir(folders{i});
    
    % Filter for items that are folders and match the folderPattern
    matchingFolders = allItems([allItems.isdir] & contains({allItems.name}, folder_pattern));
    
    % Loop over all matching folders and append to the list
    for j = 1:length(matchingFolders)
        list{end+1} = fullfile(matchingFolders(j).folder, matchingFolders(j).name);
    end
end

end