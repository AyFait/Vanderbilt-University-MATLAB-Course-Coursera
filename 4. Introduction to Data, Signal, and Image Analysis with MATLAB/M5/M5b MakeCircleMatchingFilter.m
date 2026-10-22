%{

Create a function MakeCircleMatchingFilter, which you will use in your final project script. It takes as input the diameter for the circle as well as W, the filter size for the
matching filter. It outputs the [WxW] matrix filter, which is a binary mask that contains, as foreground, a circle with width diameter centered in the matrix surrounded by
background pixels. filter serves as a matching filter for circular shapes with approximately the same diameter. The function also outputs xc and yc, the coordinates of the
center of the filter, as 2nd and 3rd optional outputs.

The steps to perform in the function are as follows:

. Initialize filter as a background (zeros) matrix.
. Find the coordinates of the center of the filter, xc, and yc.
. Use nested for loops to loop across every row and column of the filter matrix. For each pixel, determine whether the pixel's row-column coordinates falls within the circle's
radius relative to the center of the filter. If so, should be labelled as foreground with a 1.
%}

function [filter,xc,yc] = MakeCircleMatchingFilter(diameter,W)
% initialize filter
filter = zeros(W,W);

% define coordinates for the center of the WxW filter
xc = (W+1)/2;
yc = (W+1)/2;

% Use double-for loops to check if each pixel lies in the foreground of the circle
for r = 1:W
    for c = 1:W
        if (r-yc)^2 + (c-xc)^2 <= (diameter/2)^2
            filter(r,c) = 1;
        end
    end
end
end
