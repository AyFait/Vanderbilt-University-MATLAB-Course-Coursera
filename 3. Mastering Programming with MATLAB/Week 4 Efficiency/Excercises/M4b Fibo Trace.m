%{
For the function:

function f = fibo(n)
if n <= 2
f=1;
else
f = fibo(n-2) + fibo(n-1);
end
end

modify the function above, so that it has an additional input argument, a vector v. The vector needs to store the input arguments of the recursive function calls in the order they were made. Let's call the function fibo_trace,
%}


function [f,v] = fibo_trace(n,v)

% FIBO_TRACE  Fibonacci number with a trace of recursive calls.
%
%   [f,v] = fibo_trace(n,v) computes the nth Fibonacci number.
%   The vector v contains the input n for each recursive call,
%   in the order in which the calls are made.
%
%   For a new calculation, initialize v to []:
%
%       [f,v] = fibo_trace(5,[])

% Record the current function call.
v(end+1) = n;

if n <= 2
    f = 1;
else
    [f1,v] = fibo_trace(n-2,v);
    [f2,v] = fibo_trace(n-1,v);

    f = f1 + f2;
end

end
