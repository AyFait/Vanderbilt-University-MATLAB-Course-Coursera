function result = process_data_v1(data)
    result = [];
    for i = 1:length(data)
        if data(i) > 0
            result(end+1) = sqrt(data(i));
        end
    end
end
