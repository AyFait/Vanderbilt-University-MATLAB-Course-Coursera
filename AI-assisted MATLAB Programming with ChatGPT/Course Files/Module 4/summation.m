function n = summation(x,Smin)
    S = 0;
    n = 0;
    while S <= Smin
        S = S + x^n;
        n = n + 1;
    end
       n = n - 1; % undoes extra n+1 
end
 