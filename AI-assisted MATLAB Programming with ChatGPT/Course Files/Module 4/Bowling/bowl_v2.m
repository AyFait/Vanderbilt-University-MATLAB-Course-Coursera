function score = bowl(pins)
    numpins = length(pins);                     % number of pins in input
    index = 0;                                  % index into pins
    first = 1;                                  % multiply next pin
    second = 1;                                 % multiply pin after next
    score = 0;                                  % cummulative sum
    if sum(pins > 10 | pins < 0) > 0            % single hit must be between 0 and 10 inclusive
        error('Pins must be between 0 and 10');
        return;
    end    
    for ii = 1:10                               % first ten frames
        index = index + 1;                      % take next pin
        if index > numpins                      % not enough pins
            fprintf('Incomplete game...\n');
            return;
        end
        score = score + first * pins(index);    % counts score including extra from previous strike or spare
        first = second;                         % move multiplier value from second to first
        second = 1;                             % reset multpilier for the pin after next to 1
if pins(index) == 10                    % strike
    score = score + first * pins(index); % Add score for the current strike
    first = second;                     % Move the second multiplier to first
    second = 2;                         % Keep the second multiplier for the next frame
    if first == 2                       % If the previous frame was also a strike
        second = 3;                     % Apply cascading bonus for consecutive strikes
    end
    continue;                           % Move to the next frame
end
        index = index + 1;                      % take next pin
        if index > numpins                      % not enough pins
            fprintf('Incomplete game...\n');
            return;
        end
        score = score + first * pins(index);            % counts score including extra from previous strike
        first = second;                                 % move multiplier value from second to first
        second = 1;                                     % reset multpilier for the pin after next to 1
        if pins(index) + pins(index -1) == 10           % spare
            first = first + 1;                          % so next counts extra
        elseif  pins(index) + pins(index -1) > 10       % cannot score higher than 10 in a frame
            error('Pins in a frame cannot exceed 10');
        end
    end
    for ii = [first second]                     % max 2 extra pins if needed
        if ii < 2                               % no extra pin here
            break;                              % we are done
        end
        index = index + 1;                      % take next pin
        if index > numpins                      % not enough pins
            fprintf('Incomplete game...\n');
            return;
        end
        score = score + (ii-1) * pins(index);   % extra pins: count them one less
    end
    if index < numpins                          % extra pins in the input
        fprintf('Too many pins in input');
        fprintf('\n');
    end
end

    
    
    
