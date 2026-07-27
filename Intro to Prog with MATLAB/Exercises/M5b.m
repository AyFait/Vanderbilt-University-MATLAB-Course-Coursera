%{ Write a function called trio that takes two positive integer inputs n and m. The function returns a 3n-by-m matrix called T. 
The top third of T (an n by m submatrix) is all 1s, the middle third is all 2-s while the bottom third is all 3-s. 
%}

function T = trio (n, m)
a = ones(n,m);
b = ones(n,m)*2; %multiply each elmt, 1, by 2
c = ones(n,m)*3; %multiply each elmt, 1, by 3
T = [a;b;c]; %stack each result on each other
end
