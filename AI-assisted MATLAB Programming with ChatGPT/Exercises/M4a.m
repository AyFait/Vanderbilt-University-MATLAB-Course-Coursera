%{
This MATLAB function seems to has a bug, fix it:
function M = mystery(x,y,s,c,d,M)
    if nargin < 1
        x = 1;
        y = 1;
        s = 640;
        d = 3;
        M = zeros(s);
    end
    if d > 0
        M = mystery(x,y,s,0,d-1,M);
        M = mystery(x+s,y,s,255,d-1,M);
        M = mystery(x,y+s,s,255,d-1,M);
        M = mystery(x+s,y+s,s,0,d-1,M);
    else
        M(x:x+s-1,y:y+s-1) = c;
    end
end

This function has two main bugs that prevent it from running correctly:
1. Incorrect quadrant size (s is not halved): The recursive calls pass s instead of s/2. 
This causes offset coordinates like x + s to fall outside the bounds of matrix M (e.g., 1 + 640 = 641 on a $640 \times 640$ matrix), throwing an index-out-of-bounds error and preventing spatial subdivision.
2. Uninitialized parameter c: The parameter c is missing from the default input check block (nargin < 1), which causes an undefined variable error if $d=0$ at top level.
%}

function M = mystery(x,y,s,c,d,M)
    if nargin < 1
        x = 1;
        y = 1;
        s = 640;
        d = 3;
        M = zeros(s);
    end
    if d > 0
        s2 = s/2;                     % <-- key fix: halve the block size
        M = mystery(x,      y,      s2, 0,   d-1, M);
        M = mystery(x+s2,   y,      s2, 255, d-1, M);
        M = mystery(x,      y+s2,   s2, 255, d-1, M);
        M = mystery(x+s2,   y+s2,   s2, 0,   d-1, M);
    else
        M(x:x+s-1, y:y+s-1) = c;
    end
end
