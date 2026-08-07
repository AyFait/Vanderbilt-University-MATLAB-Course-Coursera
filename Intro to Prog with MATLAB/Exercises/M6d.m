%{
Write a function called valid_date that takes three positive integer scalar inputs year, month, day. If these three represent a valid date, return a logical true, otherwise false. The
name of the output argument is valid. If any of the inputs is not a positive integer scalar, return false as well. Note that every year that is exactly divisible by 4 is a leap year,
except for years that are exactly divisible by 100. However, years that are exactly divisible by 400 are also leap years. For example, the year 1900 was not leap year, but the year
2000 was. Note that your solution must not contain any of the date related built-in MATLAB functions.
%}



function valid = valid_date(year, month, day)
    % Default output to false
    valid = false;
    
    % Check if all inputs are positive integer scalars
    if ~check_scalar_pos_int(year) || ~check_scalar_pos_int(month) || ~check_scalar_pos_int(day)
        return;
    end
    
    % Check if the month is within the valid range
    if month < 1 || month > 12
        return;
    end
    
    % Determine if it is a leap year
    is_leap = (mod(year, 4) == 0 && mod(year, 100) ~= 0) || (mod(year, 400) == 0);
    
    % Define the maximum number of days for each month
    days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    
    % Adjust February for leap years
    if is_leap
        days_in_months(2) = 29;
    end
    
    % Validate if the day falls within the allowed days for that month
    if day >= 1 && day <= days_in_months(month)
        valid = true;
    end
end

% Helper function to validate positive integer scalar constraints
function out = check_scalar_pos_int(m)
    out = isscalar(m) && (m > 0) && (m == fix(m));
end

%{
elseif ~isscalar(m) || m < 1 || m ~= fix (m)
error('m needs to be a positive integer');
end
%}

%{ Code still need to be fixed to be able to catch errors
