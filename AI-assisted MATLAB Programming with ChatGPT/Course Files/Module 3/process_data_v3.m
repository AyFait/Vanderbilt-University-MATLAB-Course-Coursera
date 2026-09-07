function result = process_data_v3(data)
    if ~isnumeric(data)
        error('Numeric input expected');
    end
    result = zeros(1,sum(data>0));
    result = sqrt(data(data>0));
end
