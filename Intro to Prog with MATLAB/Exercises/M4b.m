%{ Write a function called corners that takes a matrix as an input argument and returns four outputs: the elements at its four corners in this order: top_left, top_right, bottom_left and bottom_right. (Note that loops and if-statements are neither necessary nor allowed as we have not covered them yet.) See an example run below:
>> [a, b, c, d] = corners([1 2; 3 4])
a =
     1
b =
     2
c =
     3
d =
     4
%}

function [m, n, o, p] = corners(A)
%[r,c] = size(A);
%[m, n, o, p] = [A(1,1), A(1,end), A(end,1), A(end,end)];
m = A(1,1);
n = A(1,end);
o = A(end,1);
p = A(end,end);
end


%{
A = randi(100,4,5)
[top_left, top_right, bottom_left, bottom_right] = corners(A)
B = [1; 2]
[top_left, top_right, bottom_left, bottom_right] = corners(B)
%}
