function validateRegistrationData2(email, password, username)
    % Initialize a cell array to store error messages
    errorMessages = {};
    
    % Validate email format and domain
    emailPattern = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|edu|org)$';
    if isempty(regexp(email, emailPattern, 'once'))
        errorMessages{end + 1} = 'Invalid email format or domain. Please use a .com, .edu, or .org email address.';
    end

    % Validate password complexity
    if length(password) < 8 || length(password) > 20
        errorMessages{end + 1} = 'Password must be from 8 to 20 characters long.';
    end
    if isempty(regexp(password, '[A-Z]', 'once'))
        errorMessages{end + 1} = 'Password must contain at least one uppercase letter.';
    end
    if isempty(regexp(password, '[a-z]', 'once'))
        errorMessages{end + 1} = 'Password must contain at least one lowercase letter.';
    end
    if isempty(regexp(password, '[0-9]', 'once'))
        errorMessages{end + 1} = 'Password must contain at least one numeric digit.';
    end
    if isempty(regexp(password, '[^a-zA-Z0-9]', 'once'))
        errorMessages{end + 1} = 'Password must contain at least one special character.';
    end

    % Validate username
    usernamePattern = '^[a-zA-Z0-9]{3,15}$';
    if isempty(regexp(username, usernamePattern, 'once'))
        errorMessages{end + 1} = 'Username must be 3 to 15 characters long and contain only alphanumeric characters with no spaces.';
    end

    % If there are any errors, display them and stop
    if ~isempty(errorMessages)
        numErrors = length(errorMessages);
        fprintf('The following %d issues were found with the registration data:\n', numErrors);
        for i = 1:numErrors
            fprintf('- %s\n', errorMessages{i});
        end
    else
        disp('Registration data is valid.');
    end
end
