%{
Write a function ImageResample, which takes as input an [MxN] image matrix img that we would like to resample and a [2x1] vector dim, which contains the desired size of the resampled image, using the interp2 and meshgrid functions as shown in the lecture. The function outputs img_resamp, the resampled version of image with datatype double and dimensions dim.
(Note that MATLAB's built in function imresize is typically used to resample images because it implements anti-aliasing filters when changing the size of an image. However, understanding how to resample an image grid using linear interpolation as we do in this problem is also a useful skill!)
%}

function img_resample = ImageResample(img, dim)
% define r,c,nr,nc
[r, c] = size(img);
nr = dim(1);
nc = dim(2);

% use the meshgrid function to determine sampling coordinates
[C, R] = meshgrid(linspace(1, c, nc), linspace(1, r, nr));

% use interp2 to interpolate
img_resample = interp2(double(img), C, R);
end
