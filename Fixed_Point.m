% Fixed Point Method

function [root, error, i] = Fixed_Point(gnString, x0, iterations, tolerance)

if nargin < 3
    iterations = 50;
    tolerance = 0.1;
elseif nargin < 4
    tolerance = 0.1;
end

%syms gn(x)
gn = sym(gnString);
root = zeros(1, iterations);
error = zeros(1, iterations);

root(1) = double(subs(gn, x0));
error(1) = abs((root(1) - x0)/root(1));

i = 1;
while error(i) > tolerance && i < iterations
    i = i + 1;
    root(i) = double(subs(gn,root(i-1)));
    error(i) = abs((root(i) - root(i-1))/root(i));
end

root = root(1:i);
error = error(1:i);
error = error * 100;

end