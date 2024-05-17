function labelCat = rename_categories(labelCat)

% Function to rename categories in a categorical array.
% Input:
%   labelCat - a categorical array containing labels.
% Output:
%   labelCat - a categorical array with renamed labels.

% Define the old and new category names for both versions
oldNames_v1 = {'turn', 'forward', 'reversal', 'roaming', 'outlier', 'reorientation'};
newNames_v1 = {'1', '2', '3', '4', '100', '200'};

% Get the existing categories
existingCats = categories(labelCat);

% Rename categories for version 1 if applicable
labelCat = rename_if_exists(labelCat, oldNames_v1, newNames_v1, existingCats);

end