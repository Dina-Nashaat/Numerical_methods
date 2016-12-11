%% Newton_Raphson
% x1 = x0 - f(x0)/f'(x0)
function [fx fdx x] = Newton_Raphson(start, fnString)
% Get the root of non-linear functions using Newton Raphson Method
syms func(x) dfunc(y)

% func(x) = x^3 - 4*(x) + 1;
func(x) = eval(fnString);
dfunc(x) = diff(func(x),x);

maxit = 3;
x = zeros(1,maxit);
x(1) = start;
fx = zeros(1,maxit);
fdx = zeros(1,maxit);

for  i = 1:maxit  
    fx(i) = double(func(x(i)));
    fdx(i) = double(dfunc(x(i)));
    x(i+1) = double(x(i)) - fx(i)/fdx(i);
end

x = x(2:end);
end
