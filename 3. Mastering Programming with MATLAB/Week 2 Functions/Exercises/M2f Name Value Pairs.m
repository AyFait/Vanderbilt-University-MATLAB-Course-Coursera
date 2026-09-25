%}
Name-value pairs are frequently used in programming. For our purposes here, a name-value pair consists of a name (a char vector) and a value that can be of any data type. 
Write a function called name_value_pairs that has a variable number of input arguments representing name-value pairs. 
Naturally, they come in pairs: the first is the name, the next is the value. This means that the function must be called with an even number of actual input arguments. 
The function returns a single cell array which has exactly two columns: the first column contains the names, while the second column contains the values. If the function is called with no input arguments, or it is called with an odd number of inputs or if a name is not of char type, the function returns an empty cell array.

%}

function pairs = name_value_pairs(varargin)
%NAME_VALUE_PAIRS Create a cell array from name-value pairs.
%
%   PAIRS = NAME_VALUE_PAIRS(NAME1,VALUE1,NAME2,VALUE2,...)
%   returns a two-column cell array containing the names in the
%   first column and the corresponding values in the second column.
%
%   If there are no inputs, an odd number of inputs, or a name is
%   not a character array, PAIRS is returned as an empty cell array.

% Start with an empty cell array.
pairs = {};

% There must be at least one input, and inputs must come in pairs.
if nargin == 0 || mod(nargin,2) ~= 0
    return
end

% The names are in positions 1, 3, 5, ...
names = varargin(1:2:end);

% Every name must be a character array.
if ~all(cellfun(@ischar,names))
    return
end

% Arrange the inputs into two columns:
% name | value
pairs = reshape(varargin,2,[]).';
end
