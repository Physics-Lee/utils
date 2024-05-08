function is_equal = are_two_matrices_equal(A, B)

% Set the tolerance level
tolerance = 1e-5;

% Check if dimensions are the same
if size(A) ~= size(B)
    is_equal = false;
    return;
end

% Check if all elements are within the tolerance
difference = abs(A - B);
is_equal = all(difference(:) < tolerance);

end
