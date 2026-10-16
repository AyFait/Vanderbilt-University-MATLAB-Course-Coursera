%{
ErrorEstimationPlot:
Create the ErrorEstimationPlot function that we created in the lecture. It takes as input an [Mx1] vector prediction and an [Mx1] vector target. 
It returns the mean squared error mse between the prediction and the target vectors, the correlation R and statistical significance p-value from computing Pearson's correlation coefficient, and the range of the data rg used to draw the diagonal of the plot. 
It creates a plot in the current figure equivalent when running the example code.
%}


function [mse,R,p,rg] = ErrorEstimationPlot(prediction,target)

% Compute the mean squared error
mse = mean((prediction - target).^2);

% Compute Pearson's correlation coefficient and p-value
[R,p] = corr(prediction,target,'Type','Pearson');

% Determine the range of the data
rg = [min([prediction; target]), max([prediction; target])];

% Plot predictions against targets
plot(target,prediction,'*');
hold on

% Plot the diagonal reference line
plot(rg,rg,'r--');

% Label the axes
xlabel('Target');
ylabel('Prediction');

% Use equal scaling for both axes
axis equal

end
