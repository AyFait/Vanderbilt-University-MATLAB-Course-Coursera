%{
In a voting center, the voters are required to give their names and ID numbers to the voting staff before going into the voting room. 
Write a function called voters to record the incoming voters' information. 
The function should take an unspecified number of inputs, but the first input will be the current database. 
The rest of the arguments must come in the order of name, a string or char array, and ID, an integer or integer-valued double. 
If there is at least one occurrence of no ID number after a name, or the data types are not what's required, return the original database. 
%}

function database = voters(database,varargin)
%VOTERS Record voter names and ID numbers.
%
%   DATABASE = VOTERS(DATABASE,NAME,ID,...)
%   adds each NAME/ID pair to the database.
%
%   NAME must be a string scalar or character vector.
%   ID must be an integer-valued numeric scalar.
%   If any input is invalid, DATABASE is returned unchanged.

    % The inputs after DATABASE must occur in pairs.
    if mod(numel(varargin),2) ~= 0
        return
    end

    % Validate every voter before changing the database.
    n = numel(varargin)/2;
    newVoters = repmat(struct('Name',"",'ID',0),1,n);

    for k = 1:n
        name = varargin{2*k-1};
        id   = varargin{2*k};

        % Name must be a string scalar or character vector.
        validName = (isstring(name) && isscalar(name)) || ...
                    (ischar(name) && isrow(name));

        % ID must be a scalar integer or integer-valued double.
        validID = isnumeric(id) && isscalar(id) && ...
                  isreal(id) && isfinite(id) && fix(double(id)) == double(id);

        if ~(validName && validID)
            return
        end

        newVoters(k).Name = string(name);
        newVoters(k).ID   = double(id);
    end

    % Only modify the database after all inputs have been validated.
    database = [database newVoters];
end
