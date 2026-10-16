%{
Musical chords are played on a guitar by strumming up to 6 strings simultaneously with one hand, while using fingers on the other hand to press the strings to the fretboard to
shorten the strings by different amounts to modify the notes each string plays. An E-major chord is played by by strumming the 6 strings with fingers positioned such that the
strings reverberate with the following fundamental frequencies:
Note   Frequency
1: E | 330 Hz

2: B | 247 Hz

3: G# | 208 Hz

4: E | 165 Hz

5: B | 123 Hz

6: E | 82 Hz

Plucking a guitar string also generates higher frequency harmonics in addition to the fundamental frequency that give it a full, rich sound. "Pure tones" do not produce such
rich sounds, however, in this exercise, we will simulate a simple "pure tone" guitar.
Your task is to write a script that creates a sound signal by combining the 6 pure tones.
. create a row vector t that spans [0, 3) seconds using a sampling frequency, Fs = 44100 Hz
. create an output signal y that is the sum of cosines (amplitude = 1, phase = 0) with the frequencies provided in the table.

%}



% Define sampling frequency and sound frequencies
Fs = 44100;
T = 3;
f = [330 247 208 165 123 82];

% Compute time vector
t = 0:1/Fs:T-1/Fs;

% Construct the sound as a sum of cosines
y = zeros(size(t));

for k = 1:length(f)
    y = y + cos(2*pi*f(k)*t);
end
