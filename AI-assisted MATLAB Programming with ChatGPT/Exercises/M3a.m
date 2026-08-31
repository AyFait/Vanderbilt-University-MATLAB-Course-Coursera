%{
The traditional two-sum problem is to find a pair of numbers in a vector that add up to a certain target number. Let's make it a bit more complicated by asking for the indices of all such pairs. In addition, we allow the input vector to have repeated entries. The brute force method, that is, the one that looks at all possible pairs of numbers is pretty straightforward:
function indices = two_sum(nums, target)|
n = length(nums);
indices = [];
for ii = 1:n-1
  for jj = ii+1:n
    if nums(ii) + nums(jj) == target
      indices = [indices; ii, jj];

    end

  end

end

However, it is slow for long input vectors. Your task is to find a more efficient way to solving this problem. Make sure that the output two-column matrix of indices is ordered by the first column first and then the second column. The way the simple solution above works does this naturally.
%}


%{

function indices = two_sum(x,target)
%TWO_SUM Find indices of all pairs whose values sum to TARGET.
%
%   INDICES = TWO_SUM(X,TARGET) returns a two-column matrix containing
%   the indices [i j] of all pairs satisfying
%
%       X(i) + X(j) == TARGET,    i < j
%
%   Repeated values are allowed. Every distinct pair of indices is
%   returned exactly once.
%
%   The rows of INDICES are ordered by the first column and then
%   by the second column.
%
%   Example:
%
%       x = [1 2 2 4 5 5 6];
%       indices = two_sum(x,6)
%
%   returns
%       1     5
%       1     6
%       2     4
%       3     4
%   Note: Each row represents a distinct pair of indices. The
%   documentation example above is illustrative; the actual output
%   for a given X is determined by its indices.

    x = x(:);
    n = numel(x);

    if n < 2
        indices = zeros(0,2);%returns a null "matrix" (not vector) when not enough values in input
        return
    end

    % The dictionary maps each value in X to a CELL containing all
    % indices at which that value has previously occurred.
    %
    % For example:
    %
    %   2  -> {[2 3]}
    %   5  -> {[5 6]}
    %
    % Cell values are necessary because one dictionary entry may
    % contain a vector of indices of arbitrary length.
    seen = configureDictionary(class(x),"cell");

    % Accumulate the resulting index pairs.
    indices = zeros(0,2);

    for j = 1:n

        % Value needed to make TARGET with x(j).
        complement = target - x(j);

        % Have we already encountered the complement?
        if isKey(seen,complement)

            % Curly braces extract the actual vector from the cell.
            previous = seen{complement};

            % Every previous occurrence forms a valid pair with j.
            indices = [indices; ...
                       previous(:), repmat(j,numel(previous),1)]; %#ok<AGROW>
        end

        % Record the current index for x(j).
        if isKey(seen,x(j))
            seen{x(j)} = [seen{x(j)}; j];
        else
            seen{x(j)} = j;
        end
    end

    % Guarantee lexicographic ordering:
    % first by column 1, then by column 2.
    indices = sortrows(indices,[1 2]);
end

%}


%This works fine but slow as the brute force method
%{
function indices = two_sum(nums, target)
    indices = [];
    % Use 'any' as ValueType so the map can hold arrays of indices
    map = containers.Map('KeyType', 'double', 'ValueType', 'any');
    
    for i = 1:length(nums)
        complement = target - nums(i);
        
        % If the complement exists, pair the current index with ALL its past positions
        if isKey(map, complement)
            pastIndices = map(complement);
            for j = 1:length(pastIndices)
                indices = [indices; pastIndices(j), i]; %#ok<AGROW>
            end
        end
        
        % Append the current index to the list of indices for this number
        if isKey(map, nums(i))
            map(nums(i)) = [map(nums(i)), i];
        else
            map(nums(i)) = i;
        end
    end
    
    % Sort rows to match your exact expected order (by first column, then second)
    if ~isempty(indices)
        indices = sortrows(indices);
    end
end
%}

function indices = two_sum(nums, target)
    % 1. Keep track of original 1-based indices
    origIndices = 1:length(nums);
    
    % 2. Sort the array and keep the index mapping
    [sortedNums, sortIdx] = sort(nums);
    
    indices = [];
    left = 1;
    right = length(nums);
    
    % 3. Two-pointer scan (O(N) after sorting)
    while left < right
        currentSum = sortedNums(left) + sortedNums(right);
        
        if currentSum == target
            % Found a match! We need to handle potential duplicates for both numbers
            rStart = right;
            
            % Move right pointer leftward to find all duplicates matching this left pointer
            while rStart > left && sortedNums(left) + sortedNums(rStart) == target
                % Get original indices
                idx1 = origIndices(sortIdx(left));
                idx2 = origIndices(sortIdx(rStart));
                
                % Store them such that smaller index comes first
                if idx1 < idx2
                    indices = [indices; idx1, idx2]; %#ok<AGROW>
                else
                    indices = [indices; idx2, idx1]; %#ok<AGROW>
                end
                rStart = rStart - 1;
            end
            
            left = left + 1; % Move left forward to check next unique number
            
        elseif currentSum < target
            left = left + 1;
        else
            right = right - 1;
        end
    end
    
    % 4. Final sort to match your exact expected order
    if ~isempty(indices)
        indices = sortrows(indices);
    end
end
