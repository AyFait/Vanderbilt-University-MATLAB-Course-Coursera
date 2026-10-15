%{
Plotting the ellipsoid fit to the data
Create a script to scatter plot the first 2 dimensions of the PCA linear vector space, and display a contour representing the boundary, in the first two dimensions, of the the PCA
ellipsoid with 2 standard deviations width.
The steps are:
Use the 'pca' function to find D_pca, the coordinates of the dataset in the PCA vector space, and eigvals, the corresponding eigenvalues that define the width of the axes of
the PCA ellipsoid.
. Define the x and y coordinates of the first two dimensions of the data in the PCA vector space, D_pca_x and D_pca_y. Scatter plot this x-y pair using asterisks.
. Define x and y coordinates for the shape of the PCA ellipsoid in just the first two dimensions, which is a standard ellipse, as ellipse_x and ellipse_y. The length of the long
and short axes radii should be 2 standard deviation distance along each axis. theta=0 should correspond to the positive end of the major axis of the ellipse, with radii equal
to 2 times the square root of eigenvalue 1, and theta = pi/2 corresponds to the positive end of the minor axis of the ellipse, with radii 2 times the square root of eigenvalue 2.
Plot the ellipse using red dashed lines.
%}


load fisheriris
D = meas; % [150 x 4] data matrix

% Compute D_pca and eigenvalues using the pca function
[D_pca_coeff, D_pca, eigvals] = pca(D);

% Define D_pca_x and D_pca_y, the first two dimensions
D_pca_x = D_pca(:,1);
D_pca_y = D_pca(:,2);

% Scatter plot the data with asterisks '*'
plot(D_pca_x, D_pca_y, '*');
hold on

% Define ellipse_x and ellipse_y as a function of theta
theta = 2*pi*[0:100]/100;
ellipse_x = 2*sqrt(eigvals(1))*cos(theta);
ellipse_y = 2*sqrt(eigvals(2))*sin(theta);

% Plot the ellipse with red dashed lines 'r--'
plot(ellipse_x, ellipse_y, 'r--');

% Use axis equal to correct aspect ratio
axis equal
