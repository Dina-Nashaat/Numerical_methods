%% Fixed Point Method

function root = Fixed_Point(fnString, x0, iterations, tolerance)

if nargin < 3
    iterations = 50;
    tolerance = 0.00001;
elseif nargin < 4
    tolerance = 0.00001;
end

syms fn(x)
fn(x) = eval(fnString);

root = fn(x0);

for i = 1:iterations
    if abs(x0-root) > tolerance
        x0 = root;
        root = fn(x0);
    else
        break;
    end
end

end