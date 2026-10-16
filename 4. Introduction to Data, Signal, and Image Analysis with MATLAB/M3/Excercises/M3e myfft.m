%{
Write your own myfft function identically to the one implemented in the lecture. It takes as input a [Nx1] signal vector y and sampling frequency Fs. It outputs yfft, the first
portion of the Fourier Transform as demonstrated in the lecture, as well as the frequency vector f.
The steps are:
. Compute the standard FFT
. Trim away the redundant part
. Compute the frequencies to which each FFT entry corresponds

As an example, the magnitude of a single "impulse" is a vector of all 1's.

FS = 10;
y = [0 0 0 0 1 0 0 0 0 0]';
[yfft, f] = myfft(y,Fs);

Your function should give the following result
abs(yfft) is a vector of all 1's and f = (0:5)'
%}

function [yfft, f] = myfft(y,Fs)
%compute the standard fft
N = length(y);
yfft = fft(y);

%trim away the redundant part
yfft = yfft(1:floor(N/2)+1);

%compute the frequencies to which each fft entry corresponds.
f = (0:floor(N/2))' * Fs/N;
end
