  %{
 Write a function called halfsum that takes as input a matrix and computes the sum of its elements that are in the diagonal and are to the right of it. 
The diagonal is defined as the set of those elements whose column and row indexes are the same. In other words, the function adds up the element in the uppertriangular part of the matrix. 
The name of the output argument is summa.
  %}



function summa = halfsum(A)
    % Initialize the output variable
    summa = 0;
    
    % Get the matrix dimensions
    [rows, cols] = size(A);
    
    % Loop through each row
    for r = 1:rows
        % Loop through columns starting from the main diagonal (c = r)
        for c = r:cols
            summa = summa + A(r, c);
        end
    end
end
