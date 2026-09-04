function grayImage = rgb2gray_custom(rgbImage)
    % Convert RGB image to grayscale
    % Input: rgbImage - m-by-n-by-3 array
    % Output: grayImage - m-by-n single-channel array

    % Validate input
    if size(rgbImage, 3) ~= 3
        error('Input must be an RGB image.');
    end

    % Convert to double for computation
    rgbImage = im2double(rgbImage);

    % Apply the NTSC conversion formula
    grayImage = 0.2989 * rgbImage(:, :, 1) + ...
                0.5870 * rgbImage(:, :, 2) + ...
                0.1140 * rgbImage(:, :, 3);
end
