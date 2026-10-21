%{
In the lecture, we saw how the function 'otsuthresh' can be used to determine a normalized intensity threshold for an image.
Write a function OtsuThreshold, which takes as input an [MxN] uint8 image matrix img, and outputs the Otsu thresholded binary image in [MxN] matrix msk, as well as the
integer threshold thrsh used to make msk.
The steps are:

. Define the Otsu threshold thrsh using the histogram of img.
. Apply the threshold to img to make msk.
%]

function [msk, thrsh] = OtsuThreshold(img)
% Define the Otsu threshold 'thrsh' using the histogram of img
counts = imhist(img);
t      = otsuthresh(counts);   % normalized threshold in [0,1]
thrsh  = round(t * 255);       % integer threshold on the 0-255 scale

% Apply the threshold to 'img' to make 'msk'
msk = img > thrsh;
end
