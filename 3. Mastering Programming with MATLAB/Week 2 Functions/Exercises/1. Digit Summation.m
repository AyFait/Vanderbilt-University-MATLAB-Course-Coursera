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
