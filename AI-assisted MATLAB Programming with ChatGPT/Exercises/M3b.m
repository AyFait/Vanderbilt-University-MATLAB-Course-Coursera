
function [people, films] = max_joint_movies(persons, actors)
%MAX_JOINT_MOVIES Find the two people who acted together most often.
%
%   actors(:,1) = movie ID
%   actors(:,2) = person ID

    nMovies = max(actors(:,1));
    nPeople = numel(persons);

    % A(movie,person) = 1 if person acted in movie.
    A = sparse(actors(:,1), actors(:,2), true, nMovies, nPeople);

    blockSize = 500;

    bestCount = 0;
    bestPair = [0 0];

    for first = 1:blockSize:nPeople

        last = min(first + blockSize - 1, nPeople);
        block = first:last;

        % Count common movies between this block of people
        % and everybody else.
        shared = A(:,block)' * A;

        % A person should not be paired with themselves.
        for k = 1:numel(block)
            shared(k, block(k)) = 0;
        end

        % Find the best pair in this block.
        [count, index] = max(shared(:));

        if count > bestCount
            [row, col] = ind2sub(size(shared), index);

            bestCount = count;
            bestPair = [block(row), col];
        end
    end

    people = bestPair;

    % Find the movies appearing in both people's columns.
    commonMovies = A(:,people(1)) & A(:,people(2));

    films = find(commonMovies);
end
