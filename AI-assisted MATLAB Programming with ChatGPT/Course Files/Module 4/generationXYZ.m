function answer = generationXYZ(year)
    if year < 1966
        answer = 'Too old';
    elseif 1966 <= year <= 1980
        answer = 'Generation X';
    elseif 1981 <= year <= 1999
        answer = 'Generation Y';
    elseif 2000 <= year <= 2012
        answer = 'Generation Z';        
    else
        answer = 'Too young';
    end
end
