function blurredImage = gaussian_blur(grayImage, kernelSize, sigma)
    % Apply Gaussian blur to grayscale image
    % Input: grayImage - m-by-n array
    %        kernelSize - size of the Gaussian kernel (odd integer)
    %        sigma - standard deviation of the Gaussian distribution
    % Output: blurredImage - m-by-n array

    % Validate inputs
    if mod(kernelSize, 2) == 0
        error('Kernel size must be an odd integer.');
    end

    % Create Gaussian kernel
    halfSize = (kernelSize - 1) / 2;
    [x, y] = meshgrid(-halfSize:halfSize, -halfSize:halfSize);
    g = exp(-(x.^2 + y.^2) / (2 * sigma^2));
    g = g / sum(g(:));

    % Apply Gaussian filter
    blurredImage = conv2(grayImage, g);
end
