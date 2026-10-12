%{
Write a function called standard_deviation_distance that takes as input a [1xN] data vector v and a [1x1] number x, in that order. The function computes what is called the "standard deviation distance" from x to dataset v. The standard deviation describes the typical distance of the numbers in the dataset to the mean of the dataset. The standard deviation distance to a new number x describes how many multiples of the standard deviation that the number x falls from the mean of the dataset v, which helps describes how much of an outlier the new number is. For example a standard deviation distance of 1 would imply x falls 1 standard deviation of the mean of v, and so it would be a number that is fairly representative of this dataset, whereas a distance of 3 or more would imply that x falls 3 or more standard deviations from the mean and could be an outlier.

The distance should be what is called a "signed distance", where the function returns a postive distance for input values of x greater than the mean of v and returns a negative distance for input values of x less than the mean of v. For example, the standard deviation distance of x=7 from dataset v=[10 12 14], which has mean 12 and standard deviation 2, is equal to -2.5 because x is 2.5 standard deviations below the mean of v.

expalin your thought process of the code
%}


function dist = standard_deviation_distance(v, x)
% STANDARD_DEVIATION_DISTANCE Signed distance from x to dataset v,
% measured in standard deviations.
%
% Inputs:
%   v - A 1xN data vector
%   x - A scalar value
%
% Output:
%   d - Signed standard deviation distance

    mn = mean(v);
    sd = std(v);

    dist = (x - mn) / sd;
end
