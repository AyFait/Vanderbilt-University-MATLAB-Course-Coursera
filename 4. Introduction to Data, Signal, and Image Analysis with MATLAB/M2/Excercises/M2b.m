*{
How many dimensions do I need?
Create a script to compute the number of feature dimensions N needed to represent at least 99.9% of the variance in the feature set of the humanactivity dataset using the
'pca' function.
The steps are:

. Compute eigvals using the 'pca' function
. Define vector cumulative_percent_variance_permode, which is a vector the same size as eigvals that contains 100 times (to convert fraction to percentage) the
cumulative sum of the normalized eigenvalues
. Define N as the number of eigenvectors needed to capture at least 99.9% of the variation in our dataset D.
*}


load humact.mat
D = feat; % [24075 x 60] matrix containing 60 feature measurements from 24075 samples

% Compute eigenvalues
[~,~,eigvals] = pca(D);

% Compute the cumulative_percent_variance_permode vector
cumulative_percent_variance_permode = 100 * cumsum(eigvals) / sum(eigvals);

% Define N as the number of eigenvectors needed to capture at least 99.9% of the variation in D.
N = find(cumulative_percent_variance_permode >= 99.9, 1, 'first');
