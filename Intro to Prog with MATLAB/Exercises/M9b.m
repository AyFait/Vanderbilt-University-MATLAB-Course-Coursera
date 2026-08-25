%{
Write a function called char_counter that counts the number of a certain character in a text file. 
The function takes two input arguments, fname, a char vector of the filename and character, the char it counts in the file. 
The function returns charnum, the number of characters found. 
If the file is not found or character is not a valid char, the function return -1. in MATLAB
%}

function charnum = char_counter(fname, character)
    % Check if 'character' is a valid char and exactly one character long
    if ~ischar(character) || length(character) ~= 1
        charnum = -1;
        return;
    end

    try
        % Read the entire file as a string
        textData = fileread(fname);
        
        % Count the occurrences of the specified character
        charnum = sum(textData == character);
        
    catch
        % Return -1 if the file cannot be opened or found
        charnum = -1;
    end
end
