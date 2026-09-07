function result = process_data_v2(data)
    result = zeros(1,sum(data(:) > 0));
    ind = 1;
    for i = 1:length(data)
        if data(i) > 0
            result(ind) = sqrt(data(i));
            ind = ind+1;
        end
    end
end
