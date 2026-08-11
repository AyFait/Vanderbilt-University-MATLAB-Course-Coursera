%{
Write a function called max_sum that takes v, a row vector of numbers, and n, a positive integer as inputs. 
The function needs to find the n consecutive elements of v whose sum
is the largest possible. 
In other words, if v is [1 2 3 4 5 4 3 2 1] and n is 3, it will find 4 5 and 4 because their sum of 13 is the largest of any 3 consecutive elements of v. 
If multiple
such sequences exist in v, max_sum returns the first one. 
The function returns summa, the sum as the first output argument and index, the index of the first element of the n
consecutive ones as the second output. 
If the input n is larger than the number of elements of v, the function returns 0 as the sum and -1 as the index.
%}


function [summa, index] = max_sum(v, n)
if n > length(v);
    summa = 0; index = -1;
else
    valid_elmt_blocks = length(v) - n + 1;
    %{
    valid_elmt_blocks; Finds the total number of valid element blocks in the array.
    For a 5-element array, (5 - 3 + 1 = 3) total blocks.
    This prevents the loop from running out of bounds at the end of the array and also knowing the number of blocks needed.
    %}
    k = zeros(1, valid_elmt_blocks); %initialize the resulting consecutive sum arrays
    for i = 1:valid_elmt_blocks;
       k(i) = sum(v(i:n+i-1))%append sums to k starting from when i=1 to when i=i
    end
    [summa, index] = max(k)
    %largestSet = v(index:index+n-1);
    
end


