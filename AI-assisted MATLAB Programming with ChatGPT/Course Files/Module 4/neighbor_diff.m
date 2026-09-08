function d = neighbor_diff(v)
    for ii = 1:length(v)
        d(ii) = v(ii+1) - v(ii);
    end
end