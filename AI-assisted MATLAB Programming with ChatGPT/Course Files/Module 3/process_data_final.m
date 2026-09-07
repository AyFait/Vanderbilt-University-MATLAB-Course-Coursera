function result = process_data(data)
% process_data - Computes the square roots of positive elements in the input array.
%
% Syntax: result = process_data(data)
%
% Inputs:
%    data - Numeric array containing the data to be processed.
%
% Outputs:
%    result - Row vector containing the square roots of the positive elements from 'data'.
%
% Example:
%    data = [-4, 9, -16, 25];
%    result = process_data(data);
%    % result will be [3, 5]
%
% Notes:
%    - Non-positive elements in 'data' are ignored.
%    - If 'data' contains no positive elements, 'result' will be an empty array.
%
% See also: sqrt

    % Input validation: Ensure 'data' is numeric
    if ~isnumeric(data)
        error('Input must be a numeric array.');
    end

    % Extract positive elements from 'data'
    positive_elements = data(data > 0);

    % Compute the square roots of the positive elements
    result = sqrt(positive_elements);

end