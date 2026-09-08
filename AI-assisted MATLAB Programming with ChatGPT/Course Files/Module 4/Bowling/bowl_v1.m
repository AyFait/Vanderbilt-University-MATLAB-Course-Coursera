function score = bowl_v1(pins)
    % Compute the score of a bowling game given the rolls (pins)
    % Input: pins - vector of pins knocked down in order of rolls
    % Output: score - total score of the game
    
    % Check input validity
    if any(pins < 0 | pins > 10)
        error('Each roll must knock down between 0 and 10 pins.');
    end
    
    score = 0; % Total score
    frame = 1; % Frame counter
    roll = 1;  % Roll index
    
    while frame <= 10
        if roll > length(pins)
            error('Incomplete game: not enough rolls for 10 frames.');
        end
        
        % Handle strikes
        if pins(roll) == 10
            % Strike: Add 10 plus the next two rolls as a bonus
            if roll + 2 > length(pins)
                error('Incomplete game: missing rolls after a strike.');
            end
            score = score + 10 + pins(roll + 1) + pins(roll + 2);
            roll = roll + 1; % Move to the next frame
        else
            % Handle spares or normal frames
            if roll + 1 > length(pins)
                error('Incomplete game: not enough rolls for this frame.');
            end
            frameScore = pins(roll) + pins(roll + 1);
            if frameScore > 10
                error('Invalid frame: sum of rolls exceeds 10 pins.');
            end
            score = score + frameScore;
            
            % Spare: Add next roll as a bonus
            if frameScore == 10
                if roll + 2 > length(pins)
                    error('Incomplete game: missing roll after a spare.');
                end
                score = score + pins(roll + 2);
            end
            roll = roll + 2; % Move to the next frame
        end
        
        frame = frame + 1;
    end
    
    % Handle extra rolls in the 10th frame
    if roll <= length(pins)
        if pins(roll) > 10
            error('Invalid input: roll exceeds 10 pins.');
        end
        score = score + pins(roll);
    end
    if roll + 1 <= length(pins)
        if pins(roll + 1) > 10
            error('Invalid input: roll exceeds 10 pins.');
        end
        score = score + pins(roll + 1);
    end
    if roll + 2 <= length(pins)
        error('Too many rolls provided in the input.');
    end
end