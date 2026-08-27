%{
Wordle is a popular game where you have to guess a 5-letter word in 6 tries. When you make a guess, you get feedback for each letter; green means correct letter at the right
place, yellow means correct letter at the wrong place. While dark grey means that the given letter is not in the mystery word. 
Your task is to write a function called suggestNextWord to help solve the puzzle. The function takes three inputs:
. wordList: a cell array of 5-letter words (1 x N) containing the entire selection of possible words,
. letterFrequencies: a 26-element vector of letter frequencies in English from a to z,
. guessHistory: a 2-column cell array. The first element of each row is a char vector with a 5-letter word guess and the second element is the feedback; a 5-element
numerical vector where dark gray is 0, yellow is 1 and green is 2.
The function returns a char vector with the next suggested word to guess or a 0-by-0 empty char vector if no remaining word matches the feedback. This means that the inputs
contained a mistake, e.g., the wrong feedback.

The suggested guess word is one of the remaining words possible based on the past guesses and their respective feedback. If
multiple words are left, which is the case most of the time, the winner will have the highest cumulative letter frequency. If a letter appears multiple times in a word, it only counts
once. For example, if the word the function is evaluating is "SORRY" the unique letters are S, O, R and Y, so the function will add up the 4 corresponding frequencies from the
second input argument to the function. Whichever remaining possible word has the highest sum will be the winner.

In case of a tie, the one that appears first in wordList will be
retumed. Make sure that your answer is all uppercase. While all remaining words have the same probability, the rationale behind guessing a word with more frequent letters is that
it should give us more information and narrow down the set of remaining words more. If guessHistory is not provided or it is empty, the function still provides a suggested word
based on the rules above.
%}


function nextGuess = suggestNextWord(wordList, letterFrequencies, guessHistory)
% suggestNextWord suggests a good guess toward the solution in Wordle.
%
% Inputs:
%   wordList          - Cell array of 5-letter words (1 x N)
%   letterFrequencies - 26-element vector of letter frequencies in English (a-z / A-Z)
%   guessHistory      - Cell array (N x 2) where:
%                       Column 1: Previous guess strings (e.g., 'TRACE')
%                       Column 2: Feedback vectors (e.g., [1 1 0 0 1])
%
% Output:
%   nextGuess         - Suggested next word (5 uppercase letters) or '' if none match

    % Handle case where guessHistory is empty or omitted
    if nargin < 3 || isempty(guessHistory)
        guessHistory = cell(0, 2);
    end

    numWords = length(wordList);
    validFlags = true(1, numWords);
    numGuesses = size(guessHistory, 1);
    
    % 1. Filter wordList: keep only candidate words consistent with past feedback
    for i = 1:numWords
        candWord = upper(wordList{i});
        
        for g = 1:numGuesses
            guess = upper(guessHistory{g, 1});
            targetFeedback = guessHistory{g, 2};
            
            % Compute what feedback guess would receive if candWord were the true answer
            computedFeedback = getFeedback(guess, candWord);
            
            % If the computed feedback doesn't match the actual feedback, candidate is invalid
            if ~isequal(computedFeedback, targetFeedback)
                validFlags(i) = false;
                break;
            end
        end
    end
    
    % Get indices of all remaining valid words
    validIndices = find(validFlags);
    
    % Return 0-by-0 empty char vector if no candidate words remain
    if isempty(validIndices)
        nextGuess = char.empty(0, 0);
        return;
    end
    
    % 2. Score each valid candidate based on unique letter frequencies
    scores = zeros(1, length(validIndices));
    
    for k = 1:length(validIndices)
        idx = validIndices(k);
        w = upper(wordList{idx});
        
        % Extract unique characters only (each letter counted once)
        uniqueChars = unique(w);
        
        % Map uppercase characters ('A'-'Z') to indices (1-26)
        charIndices = uniqueChars - 'A' + 1;
        
        % Sum frequency values for the unique letters
        scores(k) = sum(letterFrequencies(charIndices));
    end
    
    % 3. Select the highest scoring word
    % MATLAB's max() automatically picks the first occurrence in case of a tie
    [~, bestLoc] = max(scores);
    
    % Return word formatted as uppercase
    nextGuess = upper(wordList{validIndices(bestLoc)});
end

function fb = getFeedback(guess, solution)
    % Generates standard Wordle feedback (0=gray, 1=yellow, 2=green)
    % for a guess evaluated against a candidate solution.
    fb = zeros(1, 5);
    solChars = solution;
    
    % Pass 1: Mark exact matches (Green = 2)
    for i = 1:5
        if guess(i) == solChars(i)
            fb(i) = 2;
            solChars(i) = '*'; % Mark character as used
        end
    end
    
    % Pass 2: Mark wrong-position matches (Yellow = 1)
    for i = 1:5
        if fb(i) == 0
            pos = find(solChars == guess(i), 1);
            if ~isempty(pos)
                fb(i) = 1;
                solChars(pos) = '*'; % Mark character as used
            end
        end
    end
end
