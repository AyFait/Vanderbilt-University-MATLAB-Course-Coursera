%{
Given a point A in a 2D coordinate system and a set of additional points, find all points that are closer to A than a given distance. 
Write a function called nearby that has four input arguments: the x and y coordinates of the point A, the distance limit called r and a two-column matrix P 
whose rows correspond to points where the first column are the x coordinates and the second column are the y coordinates. 
The output argument is a similar 2-column matrix, but it only contains points whose distance to A are smaller than r.
%}
function Q = nearby(xA, yA, r, P)
%NEARBY Return points within distance r of point A.
%
%   Q = NEARBY(xA, yA, r, P) returns the rows of P whose
%   Euclidean distance from A = (xA,yA) is less than r.
%
%   P is an N-by-2 matrix:
%       P(:,1) = x coordinates
%       P(:,2) = y coordinates

    d = hypot(P(:,1) - xA, P(:,2) - yA);
    Q = P(d < r, :);
end
