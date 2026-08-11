%{
Write a function called freezing that takes a vector of numbers that correspond to daily low temperatures in Fahrenheit. Return numfreeze, the number of days with sub freezing
temperatures (that is, lower than 32 F) without using loops.
%}

function numfreeze = freezing(v)

numfreeze = length(v(v < 32)) %using logical indexing to get the array, the numbers, needed in v

end
