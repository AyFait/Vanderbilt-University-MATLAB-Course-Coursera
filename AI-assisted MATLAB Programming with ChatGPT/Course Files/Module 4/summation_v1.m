function n = summation_v1(x, Smin)
    % Check for invalid or edge cases
    if x <= 0 || Smin <= 0
        error('Inputs x and Smin must be positive.');
    end

    % Handle the case where x < 1
    if x < 1
        S_inf = 1 / (1 - x); % Sum of the infinite geometric series
        if S_inf <= Smin
            error('The series cannot exceed Smin for x < 1.');
        end
    end

    % Initialize variables
    S = 0;
    n = 0;

    % Compute until the sum exceeds Smin
    while S <= Smin
        S = S + x^n;
        n = n + 1;
    end

    % Adjust n to return the smallest n where the sum exceeds Smin
    n = n - 1;
end