function r = my_mod(a, b)
    % Calculate the quotient by performing floor division
    q = floor(a / b);
    
    % Calculate the remainder using the formula
    r = a - b * q;
    
    % Ensure the remainder is in the range [0, b)
    if r < 0
        r = r + b;
    end
end