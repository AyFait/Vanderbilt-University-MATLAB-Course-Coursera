%{
Given a set of approximate x and y coordinates of points in a plane, determine the best fitting line in the least square sense. Using the standard formula of a line: ax + b = y, compute a and b. That is, write a function called lin_reg that takes two row vectors of the same length called x and y as input arguments (containing x and y coordinates of points) and returns two scalars, a and b specifying the line, as output arguments.
Hint: reformulate the problem so that you can use MATLAB's built-in linear equation solving support, i.e., the \ operator. Keep in mind that in our case in the line equation ax + b=y, a and b are the unknowns and not x what we usually have in a system of linear equations. So, there is some math and thinking involved!
%}


function [a,b] = lin_reg(x,y)
%LIN_REG Least-squares fit of a straight line.
%   [a,b] = LIN_REG(x,y) returns the slope A and intercept B
%   of the line y = A*x + B that best fits the data points
%   given by the row vectors X and Y.

A = [x.' ones(numel(x),1)];
c = A \ y.';

a = c(1);
b = c(2);
end

