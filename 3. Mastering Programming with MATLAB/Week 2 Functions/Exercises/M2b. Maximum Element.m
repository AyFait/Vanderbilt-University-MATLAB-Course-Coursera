%{
Write a recursive function called recursive_max that finds the maximum element in a vector. You are not allowed to use loops or any built-in functions other than length. The
sole output argument is the maximum value in the input vector. Hint: the maximum value of a vector is the larger of its first element and the maximum of the rest of the
elements.
%}

function m = recursive_max(x)

n = length(x);

% Base case
if n == 1
    m = x(1);
    return
end

% Recursive case
m = recursive_max(x(2:n));

% Compare first element with the recursive result
if x(1) > m
    m = x(1);
end

end
