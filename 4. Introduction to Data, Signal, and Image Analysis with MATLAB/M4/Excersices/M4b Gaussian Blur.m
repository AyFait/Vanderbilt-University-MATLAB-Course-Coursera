%[
Gaussian filters can be used to blur images or remove high frequency noise.
Write a function called GaussianBlur, which takes as input an image [MXN] img and scalar sigma, representing the Gaussian filter sigma. It outputs [MxN] double matrix img_filt, the Gaussian filtered image, and [WxW] matrix filt, the Gaussian filter, as a second output. The function uses 'special' to create filt with window size W being 6* sigma round up to the next integer.
The steps are:
• Use fspecial to generate the [WxW] matrix filt.
• Apply the filter to the image using convolution.
%}

function [img_filt, filt] = GaussianBlur(img, sigma)
% Use fspecial to generate the Gaussian filter
W = ceil(6*sigma);
filt = fspecial('gaussian', W, sigma);

% Apply the filter to the image using convolution
img_filt = conv2(double(img), filt, 'same');
end
