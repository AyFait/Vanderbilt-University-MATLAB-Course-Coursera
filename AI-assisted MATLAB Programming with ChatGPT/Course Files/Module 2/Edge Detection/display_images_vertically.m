function display_images_vertically(image1, image2)
    % Display two images vertically aligned in a single figure
    % Compatible with MATLAB R2017b
    % Input: 
    %   image1 - First image array
    %   image2 - Second image array
    % No output arguments

    % Create a new figure window
    figure;

    % Display the first image in the top subplot
    subplot(2, 1, 1); % Divide the figure into a 2-row, 1-column grid, and select the top cell
    imshow(image1);   % Display the first image
    title('Image 1'); % Add a title for the first image

    % Display the second image in the bottom subplot
    subplot(2, 1, 2); % Select the bottom cell in the 2-row, 1-column grid
    imshow(image2);   % Display the second image
    title('Image 2'); % Add a title for the second image
end
