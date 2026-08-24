function M = sparse2matrix(cellvec)
    sz = cellvec{1};
    val = cellvec{2};
    M = val*ones(sz);
    for i = 3:length(cellvec)
        el = cellvec{i};
        M(el(1), el(2)) = el(3);
    end
end
