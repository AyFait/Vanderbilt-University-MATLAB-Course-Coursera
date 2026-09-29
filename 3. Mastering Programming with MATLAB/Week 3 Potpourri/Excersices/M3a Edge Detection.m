
%{
Create a function, manually without using the edge function, called edgy that detects the edge of an image, it takes an original image input, and produces a processed image.
Both the input and the output argument are grayscale images
%}



function outImg = edgy(inImg)
% EDGY  Detects edges in a grayscale image using the Sobel operator.
%   inImg  : 2-D grayscale image, uint8, size M x N
%   outImg : 2-D grayscale image, uint8, size (M-2) x (N-2)

% 1. Work in double so the math doesn't clip/wrap during computation
img = double(inImg);
[rows, cols] = size(img);

% 2. Sobel kernels, exactly as specified
sx = [-1  0  1;
    -2  0  2;
    -1  0  1];
sy = [ 1  2  1;
    0  0  0;
    -1 -2 -1];

% 3. Output is 2 rows/cols smaller: only pixels with all 8 neighbors
%    present (i.e. not in the first/last row or column) can be computed
outRows = rows - 2;
outCols = cols - 2;
M = zeros(outRows, outCols);

% 4. For each valid center pixel, take its 3x3 neighborhood A and
%    compute sx = sum(sum(A .* sxKernel)), sy = sum(sum(A .* syKernel))
for r = 1:outRows
    for c = 1:outCols
        A = img(r:r+2, c:c+2);          % 3x3 neighborhood, "colon" = double dot product

        Sx = sum(sum(A .* sx));
        Sy = sum(sum(A .* sy));

        M(r, c) = sqrt(Sx^2 + Sy^2);    % gradient magnitude at this pixel
    end
end

% 5. Convert directly to uint8 (values above 255 are clipped automatically)
outImg = uint8(M);
end
