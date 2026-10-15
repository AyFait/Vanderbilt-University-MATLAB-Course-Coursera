%{
my_predictpca:
Create the my_predictpca function that we created in the lecture. It takes as input a pca model mdl created using the 'my_fitpca' function and an [MxN] data matrix D, containing N feature measurements for M samples. It has two outputs, the classification for each sample in the [Mx1] vector class that is estimated using the pca model, and the Mahalanobis distance score for each sample in the [Mx1] vector score as the second output.
1. Embed your MahalanobisDistance function you created in the previous assignment below my_predictpca so that you can use it in my_predictpca
2. Within the my_predictpca function, initialize output class and score to Mx1 zero vectors
3. Loop iteration variable i over the M samples, to classify each ith sample

Function should be in this format:
function [class,score] = my_predictpca(mdl,data)
% Initialize output 'class' and 'score' to Mx1 zero vectors

% Loop over the M samples, to classify each 'i'th sample
    % In a nested loop, loop over each 'j'th class to compare the 'i'th sample to the 'j'th class.
        % Within the loop, find the Mahalanobis distance from the 'i'th sample feature vector to the 'j'th class pca model        
    % The minimium Mahalanobis distance across the class pca models is used to choose our classification for the 'i'th sample
    % The classification and the Mahalanobis distance are stored in class(i) and score(i)

% embed your MahalanobisDistance function you created in the previous assignment here:
function [md,b,std_per_mode] = MahalanobisDistance(pcamdl,v)


. In a nested loop, loop over each jth class to compare the ith sample to the jth class.
. Within the loop, find the Mahalanobis distance from the ith sample feature vector to the jth class pca model
. The minimium Mahalanobis distance across the class pca models is used to choose our classification for the ith sample
. The classification and the Mahalanobis distance are stored in class(i) and score(/)
%}


function [class,score] = my_predictpca(mdl,data)
% Initialize output 'class' and 'score' to Mx1 zero vectors

M = size(data,1);
numclasses = length(mdl.class);

class = zeros(M,1);
score = zeros(M,1);

% Loop over the M samples
for i = 1:M

    % Initialize distances for each class
    md = zeros(numclasses,1);

    % Compare sample i with each class PCA model
    for j = 1:numclasses
        md(j) = MahalanobisDistance(mdl.class(j),data(i,:));
    end

    % Find the minimum Mahalanobis distance
    [score(i),idx] = min(md);

    % Assign the predicted class
    class(i) = idx;

end

end
% embed your MahalanobisDistance function you created in the previous assignment here:
function [md,b,std_per_mode] = MahalanobisDistance(pcamdl,v)

% Compute PCA coordinates
b = pcamdl.eigvects * (v - pcamdl.mu)';

% Compute absolute standardized distance for each mode
std_per_mode = abs(b) ./ sqrt(pcamdl.eigvals);

% Compute Mahalanobis distance
md = sqrt(sum(std_per_mode.^2));

end
