function outer = create_counter()
    count = 0;
    function inner()
        count = count + 1;
        disp(count);
    end
    outer = @inner;
end
