%{
Write a function BandPassFilter, which takes as input a [1 x N] vector x (our signal), a scalar Fs (the sampling frequency of the signal), a [1 x 2] vector freq_range (the low
and high cut-off frequencies for the passband of the filter), and an integer W (the window size of the filter). The function should use the 'fir1' function to create the filter. Apply
the filter using the 'conv' function to create the output filtered signal y. Use the 'same' argument with the 'conv' function so that y and x have the same size.
The steps are:

. Create the filter using 'fir1"
. Apply the filter using 'conv'

Note: The larger the window size W, the better the filter performance. For audio frequencies with high sampling rates, W may need to be in the hundreds to obtain good filter
performance. We will see how to visualize filter characteristics to verify filter performance in a following lesson.
%}

function y = BandPassFilter(x, Fs, freq_range, W)
%Create the filter using 'fir1'
b = fir1(W, freq_range/(Fs/2), 'bandpass');

%Apply the filter using 'conv'
y = conv(x, b, 'same');
end
