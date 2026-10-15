%{
MahalanobisDistance:
Create the MahalanobisDistance function that we created in the lecture. It takes as input a single class from the pca model mdl created using the 'my_fitpca' function and an [1xN] feature vector v, containing N feature measurements for a sample. It outputs the Mahalanobis distance from the feature vector to the pca model. It also outputs b, the coordinates within the pca model space for the feature vector, and std_per_mode, which contains the standard deviation distances from the mean for each mode of variation in the pca model.
The steps to perform in the function are as follows:
>compute b, our PCA coordinates for v, by subtracting pcamdl.mu from v and then projecting the result onto the eigenvectors by pre-multiplying by the eigenvectors matrix
>compute std_per_mode, the standard deviation distance of v from the mean for each mode of variation. This is the magnitude of b, normalized by the square root of the eigenvalues
>compute md, the Mahalanobis distance, as the square root of the sum of the squared entries in std_per_mode



Function should be in the form:
function [md,b,std_per_mode] = MahalanobisDistance(pcamdl,v)
% compute b, our PCA coordinates for v

% compute std_per_mode, the standard deviation distance from the mean for v for each mode of variation

% compute md, the Mahalanobis distance

Code to call your funtion:
mdl.class(1).eigvects = [0.7071 0.7071]; 
mdl.class(1).eigvals = 4; 
mdl.class(1).mu = [2 2];
v = [2,2];
md = MahalanobisDistance(mdl.class(1),v) % md = 0 because v = mu
v = [2,2] + 2*[0.7071 0.7071];
md = MahalanobisDistance(mdl.class(1),v) % md = 1 because v is 2/sqrt(eigval)=2/2=1 standard deviations from mean along eigenvector
v = [2,2] - 6*[0.7071 0.7071];
md = MahalanobisDistance(mdl.class(1),v) % md = 3 because v is 6/sqrt(eigval)=6/2=3 standard deviations from mean along eigenvector
v = [2,2] + [-0.7071 0.7071];
md = MahalanobisDistance(mdl.class(1),v) % md = 0 because v lies in a direction from mu that is orthogonal to the eigenvector
%}


function [md,b,std_per_mode] = MahalanobisDistance(pcamdl,v)

% Compute b, the PCA coordinates for v
b = pcamdl.eigvects * (v - pcamdl.mu)';

% Compute the absolute standard deviation distance for each mode
std_per_mode = abs(b) ./ sqrt(pcamdl.eigvals);

% Compute the Mahalanobis distance
md = sqrt(sum(std_per_mode.^2));

end
