%{
Write a recursive function called fibor (in matlab) that computes the first n elements of the Fibonacci series where n is the sole input argument. You are not allowed to use loops.
Explain your code
Also avoid function making too many recursive calls. considering space-time complexity for large n
%}

function f = fibor(n)
% FIBOR Computes the first n elements of the Fibonacci series recursively.
% Input:  n - Number of elements to compute (positive integer)
% Output: f - Row vector containing the first n Fibonacci numbers

% Input validation
if n < 1 || floor(n) ~= n
    error('Input n must be a positive integer.');
end

% Base cases
if n == 1
    f = 1;
elseif n == 2
    f = [1, 1];
else
    % Single recursive call returning the vector of size (n - 1)
    prev = fibor(n - 1);

    % Append the sum of the last two elements
    f = [prev, prev(end) + prev(end - 1)];
end
end
