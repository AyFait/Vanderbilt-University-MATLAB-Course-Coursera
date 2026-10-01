
function clique = max_clique(graph, clique)
%MAX_CLIQUE Find a largest clique in a social network.
%   clique = MAX_CLIQUE(graph) returns the largest set of
%   people who all follow each other mutually.
%
%   graph is a cell array where graph{i} contains the IDs
%   of the people followed by person i.
%
%   clique is an optional initial clique for recursion.

n = numel(graph);

% Build mutual-follow adjacency matrix.
A = false(n,n);
for i = 1:n
    A(i, graph{i}) = true;
end
A = A & A';

% Remove self-connections.
A(1:n+1:end) = false;

% Start the search.
if nargin < 2
    clique = [];
end

% Search only among nodes greater than the current
% clique's last node to avoid duplicate combinations.
if isempty(clique)
    candidates = 1:n;
else
    candidates = find(all(A(clique,:),1));
    candidates = candidates(candidates > max(clique));
end

best = clique;
best = expand(clique, candidates, best, A);

clique = best;
end

function best = expand(current, candidates, best, A)
%EXPAND Recursively extend the current clique.

while ~isempty(candidates)

    % Branch-and-bound: even using every remaining
    % candidate cannot improve the current best.
    if numel(current) + numel(candidates) <= numel(best)
        return
    end

    % Choose the next candidate.
    v = candidates(1);
    candidates(1) = [];

    % Add v to the current clique.
    newClique = [current v];

    % Update the best clique.
    if numel(newClique) > numel(best)
        best = newClique;
    end

    % Only retain candidates connected to v.
    % The candidates are already connected to all
    % members of current.
    newCandidates = candidates(A(v,candidates));

    % Recurse only if this branch can improve best.
    if numel(newClique) + numel(newCandidates) > numel(best)
        best = expand(newClique, newCandidates, best, A);
    end
end
end
