function edgeImage = sobel_edge_detection(blurredImage)
    % Perform Sobel edge detection
    % Input: blurredImage - m-by-n array
    % Output: edgeImage - m-by-n array with edge intensities

    % Define Sobel operators
    sobelX = [-1 0 1; -2 0 2; -1 0 1];
    sobelY = sobelX';

    % Apply Sobel filters
    gradX = imfilter(blurredImage, sobelX, 'replicate');
    gradY = imfilter(blurredImage, sobelY, 'replicate');

    % Compute gradient magnitude
    edgeImage = sqrt(gradX.^2 + gradY.^2);
end
