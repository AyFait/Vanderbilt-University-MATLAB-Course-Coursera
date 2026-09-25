%{
This code returns a function handle o a nested function that computed the value of a polynomial. 
Modify the code so that it does not use any loops:

function fh = get_polynomial_handle(p)
    function polynomial = poly(x)
        polynomial = 0;
        for ii = 1:length(p)
            polynomial = polynomial + p(ii) .* x.^(ii-1);
        end
    end
    fh = @poly;
end
%}
function fh = poly_fun(p)

    function polynomial = poly(x)
        powers = 0:numel(p)-1;
        polynomial = sum(p .* x.^powers);
    end

fh = @poly;
end
