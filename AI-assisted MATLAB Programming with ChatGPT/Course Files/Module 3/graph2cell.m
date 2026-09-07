function ca = graph2cell(G)
    ca = cell(1,size(G, 1));
    for ii = 1:length(G)
       ca{ii} = find(G(ii,:));
    end
end