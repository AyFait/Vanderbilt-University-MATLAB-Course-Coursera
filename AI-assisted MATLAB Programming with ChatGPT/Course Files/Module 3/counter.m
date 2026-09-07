function count = counter()
    persistent n
    if isempty(n)
        n = 0;
    end
    n = n + 1;
    count = n;
end
