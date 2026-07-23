%{
Write a function called minimax that takes M, a matrix input argument and returns mmr, 
a row vector containing the absolute values of the difference between the maximum and minimum valued elements in each row. As a second output argument called mmm,
it provides the difference between the maximum and minimum element in the entire matrix.
%}


function [mmr, mmm] = minimax(M)
M %get a view of M
[m,n] = size(M) %the rxc of M
row_1 = M(1, :); %get the 1st row

%mmr = abs(max(M, [], 2)-min(M, [], 2))';
mmr_max = max(M, [], 2);  % column vector: max of each row
mmr_min = min(M, [], 2); % column vector: min of each row
mmr = abs(mmr_max-mmr_min)'; % transpose to get a row vector

%{
M: The input data matrix.
[]: An empty placeholder. It tells MATLAB that you are not comparing M to another external matrix.
2: Specifies the dimension or direction of the operation. 
In MATLAB, 1 means columns, and 2 means rows. 
This ensures MATLAB looks across each horizontal row to find the maximum value.
%}

list = M(1:end); %turn matrix M into a row vector (can transpose ' this to get stack)
stack = M(:); %turn matrix M into a col vector (can transpose ' this to get list)
sort(stack); %arrange each elmt in ascending order

mmm = max(stack)-min(stack);
end
