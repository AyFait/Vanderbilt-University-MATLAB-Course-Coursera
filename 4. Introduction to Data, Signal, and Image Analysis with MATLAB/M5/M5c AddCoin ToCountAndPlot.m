%{
Create a function AddCoinToCountAndPlot, which you will use in your final project script. The function takes as input x and y, coordinates for the centroid of a coin found in
the image, cls, its classification label indicating whether it was found to be a dime, nickel, or quarter. The function outputs coinvalue, the value (in cents) of the coin that was
found. It also plots, in the current figure, a circle centered at x and y with radius and color unique for each coin type according to the table below. The function also has 2nd
and 3rd outputs x_plot and y_plot, the list of x and y coordinates of the vertices of the circle being plotted. x_plot should be defined using the cosine function and y_plot
using the sine function. The function also has a 4th output col, the color string of the circle plotted.
The steps to perform in the function are as follows:

. Initialize coin radius and color parameters
. Use an if-elseif statement to determine coinvalue, x_plot, y_plot, and colorcode col unique for each coin type

        Dime  Nickel  Quarter
Radius  22      30      40

Color   red    green   magenta

Value    10       5       25

%}

function [coinvalue,x_plot,y_plot,col] = AddCoinToPlotAndCount(x,y,cls)
% initialize radians for defining x_plot and y_plot using cos and sin functions
rads = 0:2*pi/32:2*pi;
% initialize parameters for radius and color of circle for each type of coin

% use if-elseif statement to define x_plot, y_plot, col
%   when cls is 1, we found a dime
%   when cls is 2, we found a nickel
%   when cls is 3, we found a quarter
if cls == 1
    radius = 22;
    col = 'r';
    coinvalue = 10;
elseif cls == 2
    radius = 30;
    col = 'g';
    coinvalue = 5;
elseif cls == 3
    radius = 40;
    col = 'm';
    coinvalue = 25;
end

x_plot = x + radius*cos(rads);
y_plot = y + radius*sin(rads);
plot(x_plot,y_plot,col);
end

