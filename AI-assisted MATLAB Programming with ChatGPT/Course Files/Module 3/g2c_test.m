% Define the number of tests
numTests = 5;
numNodes = 10; % Minimum of 10 nodes for each graph
results = struct('original', {}, 'converted', {}, 'reconstructed', {}, 'isEqual', {});

% Loop through the tests
for testIdx = 1:numTests
    % Generate a random adjacency matrix
    G = randi([0, 1], numNodes); % Random binary matrix
    % G = triu(G, 1); % Make it directed (optional: remove triu for undirected)
    % G = G + G.';    % Symmetric if undirected
    
    % Call the user's function to convert to cell array
    C = graph2cell(G);
    
    % Convert back from cell array to adjacency matrix
    reconstructedG = zeros(size(G));
    for i = 1:numNodes
        reconstructedG(i, C{i}) = 1;
    end
    
    % Check if the original and reconstructed matrices are identical
    isEqual = isequal(G, reconstructedG);
    
    % Store the results
    results(testIdx).original = G;
    results(testIdx).converted = C;
    results(testIdx).reconstructed = reconstructedG;
    results(testIdx).isEqual = isEqual;
end

% Generate the report
fprintf('Random Graph Conversion Test Results:\n');
fprintf('======================================\n');
for testIdx = 1:numTests
    fprintf('Test %d:\n', testIdx);
    fprintf('  Original matrix:\n');
    disp(results(testIdx).original);
    fprintf('  Cell vector representation:\n');
    disp(results(testIdx).converted);
    fprintf('  Reconstructed matrix:\n');
    disp(results(testIdx).reconstructed);
    if results(testIdx).isEqual
        fprintf('  Result: PASS\n');
    else
        fprintf('  Result: FAIL\n');
    end
    fprintf('--------------------------------------\n');
end
