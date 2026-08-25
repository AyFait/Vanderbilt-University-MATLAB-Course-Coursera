%{
Write a function called echo_gen that adds an echo effect to an audio recording. An echo is the original signal delayed and attenuated. Therefore, you will first need to compute the echo and then add it to the original signal with the correct offset. The function is to be called like this:
output = echo_gen(input, fs, delay, amp);
where input is a column vector with values between -1 and 1 representing a time series of digitized sound data. 
The input argument fs is the sampling rate. The sampling rate specifies how many samples we have in the data each second. 
For example, an audio CD uses 44,100 samples per second. The input argument delay represent the delay of the echo in seconds. That is, the echo should start after delay seconds have passed from the start of the audio signal. Finally, amp specifies the amplification of the echo. While typically this is a value less than 1 because the echo is not as loud, your function should work if amp is greater than 1.
The output of the function is a column vector containing the original sound with the echo superimposed. The output vector will be longer than the input vector if the delay is not zero (round to the nearest number of points needed to get the delay, as opposed to floor or ceil). A sound recording has values between -1 and 1, so if the echo causes some values to be outside of this range,
you will need to scale the entire vector, so that all values are within the range while retaining their relative amplitudes.
%}


function output = echo_gen(input, fs, delay, amp)                 
n = length(input);                                                % Determine the number of samples in the original audio signal.
delay_samples = round(delay * fs);                                % Convert the delay from seconds to samples and round to the nearest sample.
output = zeros(n + delay_samples, 1);                             % Preallocate a column vector long enough to contain the original signal and its echo.
output(1:n) = input;                                              % Copy the original audio signal into the beginning of the output.
output(delay_samples + 1 : delay_samples + n) = ...              % Select the portion of the output where the delayed signal will be placed.
    output(delay_samples + 1 : delay_samples + n) + ...           % Preserve any signal already present in the selected output section.
    amp * input;                                                   % Add the attenuated or amplified original signal to create the echo.
max_value = max(abs(output));                                      % Find the largest absolute amplitude in the resulting signal.
if max_value > 1                                                   % Check whether any sample is outside the allowed audio range of -1 to 1.
    output = output / max_value;                                   % Scale the entire signal so its largest absolute value becomes exactly 1.
end                                                               
end                                                              
