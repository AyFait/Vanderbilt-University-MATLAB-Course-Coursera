%{
Signal resampling:
Write a Matlab function SignalResample that takes as input a [1 x N] signal x and sampling frequency xFs, as well as a resampling frequency yFs. The function should use linear interpolation with interp1 to create and output signal y, a resampled version of x with sampling rate yFs. The steps are as follows:
. Find the total time duration T for the signal x with sampling frequency xFs
. Using T, define a time vector tx, which is the same size as x. Each entry in tx should contain the time for that entry, starting at time 0 and ending at time T
. Using T, define the new time vector, ty for our resampled time. The entries in ty should range from 0, in steps of 1/yFs, to T.
. Use 'interp1' to create y by resampling x to the new sampling rate using linear interpolation.

For example, if:
X = [1:0.5:5.5];
XFS = 2;
yFs = 4;
the resampled x-values will be [1 1.25 1.5 1.75 2 2.25 2.5 2.75 3 3.25 3.5 3.27 4 4.25 4.5 4.75 5 5.25 5.5]

And if:
x = [1:0.5:5.5];
XFS = 2;
yFs = 1;
the resampled x-values will be [1 2 3 4 5]

The Function should be in the format of:
function y = SignalResample(x, xFs, yFs)

% Find the total time duration 'T"

% Using 'T", define a time vector 'tx'

% Using 'T', define the new time vector, 'ty' for our resampled time.

% Use interp1 to create y by resampling x
%}

function y = SignalResample(x, xFs, yFs)

        % Find the total time duration T
        T = (length(x) - 1) / xFs;

        % Using T, define a time vector tx
        tx = 0:1/xFs:T;

        % Using T, define the new time vector ty
        ty = 0:1/yFs:T;

        % Use interp1 to create y by resampling x
        y = interp1(tx, x, ty, 'linear');

    end
