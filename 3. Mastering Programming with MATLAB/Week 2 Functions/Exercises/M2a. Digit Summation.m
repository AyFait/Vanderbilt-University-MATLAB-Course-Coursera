%{
Write a recursive function called digit_sum that computes the sum of the digits of a positive integer provided as an input argument. You do not have to check the input. You
are not allowed to use loops or string conversion functions like str2num. As an illustration, the sum of the digits of the number 12345 is 15. Hint consider what mathematical
operation you need to do to get the last digit of a base 10 number.
%}

function output = digit_sum(input)
%baseCase = 0; %base case to stop the recursion
output = 0; %base case to stop the recursion
if input == 0;
    output = 0;

else
    quotient = fix(input/10); %popping off the last value in the series
    remain = mod(input, 10); %need to add the remeainder value which is the last value in each recursion
    output = remain + digit_sum(quotient);
end

end
