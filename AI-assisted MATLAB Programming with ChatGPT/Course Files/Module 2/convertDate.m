function formattedDate = convertDate(inputDate)
    % Attempt to parse the input date with known formats
    formats = {
        'yyyy-MM-dd', 'yyyy/MM/dd', 'dd-MM-yyyy', 'dd/MM/yyyy', ...
        'MMM dd', 'MMMM dd', 'MMMM dd, yyyy', ...
        'dd-MMM-yyyy', 'dd/MMM/yyyy', ...
        'MM-dd-yyyy', 'MM/dd/yyyy'
    };
    dt = NaT; % Initialize as Not-a-Time
    
    % Try parsing the input date with each format
    for k = 1:length(formats)
        try
            dt = datetime(inputDate, 'InputFormat', formats{k}, 'Locale', 'en_US');
            break;
        catch
            % Continue to the next format if parsing fails
        end
    end
    
    if ismissing(dt)
        error('Unrecognized date format: %s', inputDate);
    end
    
    % Determine the output format based on the input
    if contains(inputDate, {'-', '/'}) && contains(formats{k}, 'yyyy')
        % Input like '2024-03-15' or '03/15/2024' → Output: 'March 15, 2024'
        formattedDate = datestr(dt, 'mmmm dd, yyyy');
    elseif contains(inputDate, {'-', '/', ' '})
        % Input like 'Mar 15' → Output: 'March 15'
        formattedDate = datestr(dt, 'mmmm dd');
    else
        error('Unrecognized date format: %s', inputDate);
    end
end
