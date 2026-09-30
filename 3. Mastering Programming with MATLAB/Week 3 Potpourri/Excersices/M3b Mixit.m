%{
Consider a multi-track audio recording: a uint16 matrix of N columns where each column represents one track, e.g., the recording of one instrument of a band playing a song.
The input range is between 0 and 65535, a value that a 16-bit analog digital converter would provide. The task is to write a simple mixing function that takes the tracks and
generates a weighted sum of them. Specifically, write a function called mixit that takes two input arguments. The first is a K-by-N matrix of uint16 values where N is the
number of tracks and K is the number of samples per track. The second input argument is a vector of N double scalars representing the weights of the tracks. The output of the
function is a K-element column vector of doubles representing a single-track audio recording obtained by mixing the individual tracks according to the static weights. Note that
before any of the processing takes place, the audio data must be converted to standard interval of [-1 1]. That is, uint16 0 needs to be mapped to-1, while 65535 becomes
+1. The output is expected to be in the same range. If any element of the final mixed audio is outside of this range, the output needs to be scaled. Hint: find the maximum of
the absolute value of the output vector. If it is greater than 1, you need to divide the entire vector with that value.

%}



function output = mixit(tracks, weights)
% Step A: convert uint16 (0..65535) to doubles in [-1, 1]
audio = 2 * double(tracks) / 65535 - 1;

% Step B: weighted sum of the tracks
weights = weights(:);        % force weights into a column (N-by-1)
output = audio * weights;    % (K-by-N) * (N-by-1) = K-by-1

% Step C: rescale if anything is outside [-1, 1]
peak = max(abs(output));
if peak > 1
    output = output / peak;
end
end
