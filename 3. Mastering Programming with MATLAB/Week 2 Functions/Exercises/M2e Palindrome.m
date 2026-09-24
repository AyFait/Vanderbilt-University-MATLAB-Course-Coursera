%{
Write a function called palindrome that takes one input argument, a char vector and recursively determines whether that argument is a palindrome. You are not allowed to
use loops, not bult-in function like strcmp, etc. The function returns true or false. Note that to keep things simple, capitalization, spaces and punctuation all matter.
%}


function tf = palindrome(str)
if length(str) <= 1
    tf = true;
else
    tf = (str(1) == str(end)) && palindrome(str(2:end-1));
end
end
