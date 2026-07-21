%{ Given a Matrix A, 
Create a row vector of 1's that has same number of elements as A has rows. 
Create a column vector of 1's that has the same number of elements as A has columns. 
Using matrix multiplication, assign the product of the row vector, the matrix A, and the column vector (in this order) to the variable result. 
%}


A = [1:5; 6:10; 11:15; 16:20];
a = A
size(A) %returns [r, c]
size(A, 1) %1 rep r
size(A, 2) %2 rep c
r = ones(1,4) %or ones(1, size(A, 1))
c = ones(5,1) %or ones(size(A, 2), 1)
result = r*A*c
