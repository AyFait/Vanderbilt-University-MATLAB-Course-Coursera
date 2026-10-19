%{
Nyquist
Write a function called IsNyquistSatisfied. The goal of the function is to confirm a proposed sampling rate, Fs, is high enough to avoid aliasing when sampling a signal that is
known to contain no frequency greater than fmax. The function takes as input fmax and Fs, and it outputs a logical value of true if aliasing will be avoided and false otherwise.
A second output, Fs_min, contains the Nyquist sampling rate.
%}

function [y, Fs_min] = IsNyquistSatisfied(fmax, Fs)
Fs_min = 2 * fmax;   % Nyquist rate
y = Fs > Fs_min;     % true if aliasing is avoided
end
