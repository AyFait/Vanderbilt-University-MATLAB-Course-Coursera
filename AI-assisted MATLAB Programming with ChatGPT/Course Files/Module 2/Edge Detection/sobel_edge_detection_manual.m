function edgeImage = sobel_edge_detection_manual_with_zero_pad(inputImage)
    % Perform Sobel edge detection with manual zero padding
    % Input:
    %   inputImage - MxN grayscale image array (assumes normalized to [0, 1])
    % Output:
    %   edgeImage - MxN array of edge intensities (same size as inputImage)

    % Validate input
    if ~ismatrix(inputImage)
        error('Input must be a 2D grayscale image.');
    end

    % Define Sobel kernels for horizontal (Gx) and vertical (Gy) edges
    sobelX = [-1  0  1; 
              -2  0  2; 
              -1  0  1];
          
    sobelY = [-1 -2 -1; 
               0  0  0; 
               1  2  1];

    % Get the size of the input image
    [rows, cols] = size(inputImage);

    % Create a padded image with zeros (manual zero-padding)
    paddedImage = zeros(rows + 2, cols + 2); % Add 1-pixel border on all sides
    paddedImage(2:end-1, 2:end-1) = inputImage; % Copy the input image into the center

    % Initialize the output edge image (same size as the input image)
    edgeImage = zeros(rows, cols);

    % Perform convolution manually
    for i = 2:rows+1
        for j = 2:cols+1
            % Extract the 3x3 neighborhood from the padded image
            neighborhood = paddedImage(i-1:i+1, j-1:j+1);
            
            % Apply Sobel kernels
            gradX = sum(sum(neighborhood .* sobelX));
            gradY = sum(sum(neighborhood .* sobelY));
            
            % Compute gradient magnitude
            edgeImage(i-1, j-1) = sqrt(gradX^2 + gradY^2);
        end
    end
end
