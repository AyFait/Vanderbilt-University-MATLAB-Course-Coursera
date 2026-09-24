

%{

a recursive function called reversal that returns the input vector with its elements reversed.
move the first element to last and reverse the rest of the vector. Try to formulate this algorithm in a recursive fashion.
Explain your code pls
%}
function y = reversal(x)
% REVERSAL Reverse the elements of a vector recursively.
%
%   y = reversal(x) returns x with its elements in reverse order.

    % Base case: an empty vector is already reversed.
    if isempty(x)
        y = x;
        return
    end

    % Recursive case:
    % Reverse everything except the first element,
    % then put the first element at the end.
    y = [reversal(x(2:end)), x(1)];

end

