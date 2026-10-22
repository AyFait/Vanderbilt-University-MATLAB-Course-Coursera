%{

Step 1. Localize the centroid of each coin
Your task in this step is to segment the coins from the background in the image and find the centroid of each distinct segmented coin

. Otsu threshold the image to create in initial, but noisy segmentation. Use your 'OtsuThreshold' function we created in the class. Embed it in the Helper Functions list at the
bottom of the script. Store the result in msk.
. Filter the mask to fill all the holes and remove all the false positives. One option is to perform a dilation operation on msk to fill in false negative holes in the initial
segmentation. You need to choose a structuring element just large enough to fill in all the holes. If you store the result in msk_dil, it will be displayed. Then, you can perform
an erosion operation on msk_dil to separate the coins that were joined together by dilation so that a distinct centroid can be found for each coin in the next step. Here, you
would choose a structuring element large enough to disconnect each coin. Storing the result in msk_dil_erd will display it.
. Use the built-in function regionprops to find the centroid of each coin as the centroid of each connected component in your filtered image. Store the result, rounded to the
closest integer, in [Nx2] matrix centroid, where N is the number of components and the columns contain the x-y coordinates for each centroid. Also record the area (total
number of pixels) of each component in [Nx1] vector component_size.

It is recommended that you write the code in chronological order and run the script each time you create a new assessed or displayed variable. For example, run your script
after creating msk, and you will see your initial thresholding result displayed in a figure. All assessed variables have been initialized as empty so that your code will execute
without errors while you are developing your script.
%}

% Define the filter size we will use in step 2:
filtsize = 85;

% Creating test image 'im' by splicing together two built in images.
% Also zero-padding (adding zeros around the border) with half the 
% filter size (filtsize) we will use so that the filter could be 
% centered on any actual image pixel, including those near the border.
% 'coins.png' contains bright nickels and dimes on a dark background
% 'eight.tif' contains dark quarters on a bright background, so we invert it
% to match 'coins.png'
im1 = imread('coins.png');
[r,c] = size(im1);
im2 = imread('eight.tif');
[r2,c2] = size(im2);
filtsizeh = floor(filtsize/2);
im = zeros(r+r2+filtsize,c+filtsize);
im(filtsizeh+1:filtsizeh+r+r2,filtsizeh+1:filtsizeh+c) = [im1;255-im2(:,1:c)];
[r,c] = size(im);
imagesc(im);colormap(gray);title('test image');axis equal;

% Initializing assessed/displayed variables as empty so that code is executable 
msk=[]; msk_dil=[]; msk_dil_erd=[]; centroid=[]; component_size=[]; 

%%%%% 1. Localize the centroid of each coin
% Otsu threshold
[msk, thrsh] = OtsuThreshold(im);
thrsh
nnz(msk)
figure; imagesc(msk); colormap(gray); title('Otsu'); axis equal;

% Dilate 
msk_dil = imdilate(msk, strel('disk', 3));
figure; imagesc(msk_dil); colormap(gray); title('Dilated'); axis equal;

% Erode 
msk_dil_erd = imerode(msk_dil, strel('disk', 12));
figure; imagesc(msk_dil_erd); colormap(gray); title('Eroded'); axis equal;

% Connected components to get centroids of coins:

props = regionprops(msk_dil_erd, 'Centroid', 'Area');
centroid = round(vertcat(props.Centroid));
component_size = vertcat(props.Area);
centroid
component_size


%%%%%%%%%%%%%%%%%%%% Helper Functions %%%%%%%%%%%%%%%%%%%%%
function [msk, thrsh] = OtsuThreshold(img)

level = graythresh(img);
thrsh = round(level * 255);
msk = img > thrsh;
end
