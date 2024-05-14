function organize_files_gui()
    % Open GUI to select directory
    sourceDirectory = uigetdir;
    
    % Check if the user canceled the directory selection
    if sourceDirectory == 0
        msgbox('No directory selected, exiting script.', 'Error', 'error');
        return;
    end

    % Change to the source directory
    cd(sourceDirectory);

    % List all items in the directory
    allItems = dir(sourceDirectory);
    
    % Filter out directories, keeping only files
    isFile = ~[allItems.isdir];
    files = {allItems(isFile).name}; % Extracting file names

    % Iterate over each file
    for i = 1:length(files)
        fileName = files{i};
        % Match filenames that contain the pattern w<number>
        pattern = 'w\d+';
        match = regexp(fileName, pattern, 'match');
        
        if ~isempty(match)
            % Extract the week number from the matched pattern
            weekNumber = match{1};
            newDir = fullfile(sourceDirectory, weekNumber); % Create new directory name
            
            % Make new directory if it does not exist
            if ~exist(newDir, 'dir')
                mkdir(newDir);
            end
            
            % Move the file to the new directory
            movefile(fullfile(sourceDirectory, fileName), fullfile(newDir, fileName));
        end
    end

    % Inform the user that files have been organized
    msgbox('Files have been organized.', 'Success');
end