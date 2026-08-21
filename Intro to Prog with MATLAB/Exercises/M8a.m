%{
Caesar's cypher is the simplest encryption algorithm. It adds a fixed value to the ASCII (unicode) value of each character of a text. In other words, it shifts the characters.
Decrypting a text is simply shifting it back by the same amount, that is, it substracts the same value from the characters. Write a function called caesar that accepts two
arguments: the first is the character vector to be encrypted, while the second is the shift amount. The function returns the output argument coded, the encrypted text.
The function needs to work with all the visible ASCII characters from space to ~. The ASCII codes of these are 32 through 126. If the shifted code goes outside of this
range, it should wrap around. For example, if we shift ~ by 1, the result should be space. If we shift space by -1, the result should be ~.
%}

function coded = caesar (characters,s)
coded = char(zeros(1, length(characters))); %need to preallocate result and ser out to char
conv = double(characters); %converting the string elemnts to real numbers once

for i = 1:length(characters) %looping throung each element
    ii = conv(i) + s;
    
    %{
    if ii > 126 %This part only checks if element is > 126 once. but breaks if still greater than 126 even after subtracting 95: 250
        ii = ii - 95; 
    elseif ii < 32 %same problem as above here 
        ii = ii + 95; 
    %} 
        
    % Keep subtracting 95 until the value is within the upper bound
    while ii > 126
        ii = ii - 95;
    end
    % Keep adding 95 until the value is within the lower bound
    while ii < 32
        ii = ii + 95;
        
    end
    coded(i) = ii;
end
