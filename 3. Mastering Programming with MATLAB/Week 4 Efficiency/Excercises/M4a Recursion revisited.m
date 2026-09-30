%{
For the recursive function:

function v = reversal(v)
if length(v) > 1
V = [v(end) reversal(v(1:end-1))];

end

end

improve this implementation to make it fast and to make it work on long vectors too. Again, it
needs to stay recursive; it just cannot have as many nested recursive calls as the number of elements the list has! 
%}


function v = reversal(v)
%REVERSAL Reverse a vector recursively.
%
%   v = reversal(v) returns V with its elements in reverse order.
%
%   The vector is divided into two halves at each recursive call, so
%   the maximum recursion depth is O(log2(N)) rather than O(N).

n = numel(v);

if n <= 1
    return
end

k = floor(n/2);

v = [reversal(v(k+1:end)), reversal(v(1:k))];

end
