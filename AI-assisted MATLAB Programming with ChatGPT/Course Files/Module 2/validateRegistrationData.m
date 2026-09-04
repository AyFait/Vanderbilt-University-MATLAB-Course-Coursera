function [isValid, errorMsg] = validateRegistrationData(email, password, username)
    % Initialize output variables
    isValid = true;
    errorMsg = '';

    % Validate email format and domain
    emailPattern = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|edu|org)$';
    if isempty(regexp(email, emailPattern, 'once'))
        isValid = false;
        errorMsg = 'Invalid email format or domain. Please use a valid email with .com, .edu, or .org domain.';
        return;
    end

    % Validate password length
    if length(password) < 8 || length(password) > 20
        isValid = false;
        errorMsg = 'Password must be between 8 and 20 characters long.';
        return;
    end

    % Validate password complexity
    if isempty(regexp(password, '[A-Z]', 'once')) || ...
       isempty(regexp(password, '[a-z]', 'once')) || ...
       isempty(regexp(password, '[0-9]', 'once')) || ...
       isempty(regexp(password, '[^a-zA-Z0-9]', 'once'))
        isValid = false;
        errorMsg = ['Password must contain at least one uppercase letter, one lowercase letter, ', ...
                    'one number, and one special character.'];
        return;
    end

    % Validate username length
    if length(username) < 3 || length(username) > 15
        isValid = false;
        errorMsg = 'Username must be between 3 and 15 characters long.';
        return;
    end

    % Validate username characters
    if isempty(regexp(username, '^[a-zA-Z0-9]+$', 'once'))
        isValid = false;
        errorMsg = 'Username must be alphanumeric and contain no spaces.';
        return;
    end
end
