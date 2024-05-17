function labelCat = rename_if_exists(labelCat, oldNames, newNames, existingCats)

% Function to rename categories if they exist in the categorical array.
% Input:
%   labelCat - a categorical array containing labels.
%   oldNames - a cell array of old category names.
%   newNames - a cell array of new category names.
%   existingCats - a cell array of existing categories in labelCat.
% Output:
%   labelCat - a categorical array with renamed labels if oldNames exist.

% Find the intersection of existing categories and the old names
[~, idx] = ismember(oldNames, existingCats);

% Rename categories if applicable
if any(idx)
    oldNames = oldNames(idx > 0);
    newNames = newNames(idx > 0);
    labelCat = renamecats(labelCat, oldNames, newNames);
end

end