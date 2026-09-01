%{
The following function adds together non-negative decimal integer scalars of any length specified as a cell vector of char vectors. 
The single output argument is the sum and it is a char vector. The input and output contain digits only; no commas, dashes, periods, spaces or any other characters are included. 
If any of these assumptions are violated by the input, the function returns '-1'. 
The reason to use char data for numbers is that they can be greater than what fits in the largest integer type, uint64.

function summa = huge_sum(numbers)
  if ~iscell(numbers) || isempty(numbers) || any(cellfun(@(x) ~ischar(x) || any(~isstrprop(x, 'digit')), numbers))
    summa = '-1';
    return;
  end
  lng = max(strlength(numbers));
  numbers = cellfun(@(s) sprintf(['%0' num2str(Ing) 's'], s), numbers, 'UniformOutput', false);
  numbers = cell2mat(numbers(:));
  carry = 0;
  for ii = 1ng :- 1:1
    c = carry + sum((numbers(:,ii) - 'e'));
    carry = floor(c/10);
    summa(ii) = char(mod(c,10) + 'e');
  end
  if carry
    summa = ['1' summa];
  end
end

Unfortunately, the function has a bug. While it produces the correct result most of the time, sometimes it does not. Fix the function!

The actual bug:

if carry
    summa = ['1' summa];
end

This assumes that if there's a leftover carry after the last (leftmost) column, it can only ever be the single digit 1. That's true only when adding two numbers — the max carry into any column is 1, since two digits (0–9 each) plus a carry of 1 sums to at most 19.

But this function is designed to add any number of values (numbers is a cell vector of arbitrary length). If you add, say, 20 numbers together, a single column's digit sum can be as large as 20 × 9 = 180, so carry can become a multi-digit number like 18. Hardcoding '1' silently truncates that — you lose digits and get a wrong (too-small) answer. This is exactly the "usually right, sometimes wrong" symptom: it works fine for typical two-operand tests, but breaks once you sum enough numbers together.

The one-line fix is replacing:
summa = ['1' summa];

with:
summa = [num2str(carry) summa];
%}



function summa = huge_sum(numbers)
    if ~iscell(numbers) || isempty(numbers) || ...
            any(cellfun(@(x) ~ischar(x) || isempty(x) || any(~isstrprop(x, 'digit')), numbers))
        summa = '-1';
        return;
    end

    lng = max(strlength(numbers));
    numbers = cellfun(@(s) sprintf(['%0' num2str(lng) 's'], s), numbers, 'UniformOutput', false);
    numbers = cell2mat(numbers(:));

    carry = 0;
    summa = char(zeros(1, lng));
    for ii = lng:-1:1
        c = carry + sum(numbers(:,ii) - '0');
        carry = floor(c/10);
        summa(ii) = char(mod(c,10) + '0');
    end

    if carry
        summa = [num2str(carry) summa];   % <-- fixed: prepend the full carry, not just '1'
    end
end
