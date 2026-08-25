%{
Write a function called blur that blurs the input image. The function is to be called like this:
output = blur(img,w);
where img, the input image is a two-dimensional matrix of grayscale pixel values between 0 and 255. 
Blurring is to be carried out by averaging the pixel values in the vicinity of every pixel. 
Specifically, the output pixel value is the mean of the pixels in a square submatrix of size 2w+1 where the given pixel sits in the center. 
For example, if w is 1, then we use a 3x3 matrix, that is, we average all the neighboring pixels of the given pixel and itself. 
Only use valid pixels when portions of the blurring matrix fall outside the image. 
For example, the blurred value corresponding to w = 1 at index (1,1) would be the mean of of elements (1,1), (1, 2), (2,1) and (2, 2). 
Both input img and output output are of type uint8.
%}




function output = blur(img,w)               

[m,n] = size(img);                       

output = zeros(m,n,'uint8');               

for i = 1:m                               % Loop through every row of the image,
                                          % from the first row to the last row.

    for j = 1:n                           % Loop through every column of the image,
                                          % from the first column to the last column.

        r1 = max(1,i-w);                  % Find the first valid row of the neighborhood.
                                          % max prevents the index from going below 1.

        r2 = min(m,i+w);                  % Find the last valid row of the neighborhood.
                                          % min prevents the index from going beyond m.

        c1 = max(1,j-w);                  % Find the first valid column of the neighborhood.
                                          % max prevents the index from going below 1.

        c2 = min(n,j+w);                  % Find the last valid column of the neighborhood.
                                          % min prevents the index from going beyond n.

        neighborhood = img(r1:r2,c1:c2);  % Extract the valid pixels surrounding the
                                          % current pixel (i,j).

        average = mean(neighborhood,'all'); % Calculate the mean of all pixels in the
                                            % neighborhood.

        output(i,j) = uint8(average);     % Convert the average to uint8 and store it
                                          % in the corresponding output pixel.

    end                                    % End of the column loop.

end                                        % End of the row loop.

end                                        % End of the blur function.
