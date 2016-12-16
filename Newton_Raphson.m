function [x error iter] = Newton_Raphson(start, fnString, iter, tol)
% Get the root of non-linear functions using Newton Raphson Method

func = sym(fnString);
dfunc = diff(func);
iter = 0;
maxit = 3;
x = zeros(1,maxit);
error = zeros(1, maxit);
x(1) = start;
fx = zeros(1,maxit);
fdx = zeros(1,maxit);

for  i = 1:maxit  
    iter = iter + 1;
    fx(i) = subs(func, x(i));
    fdx(i) = subs(dfunc, x(i));
    x(i+1) = double(x(i)) - fx(i)/fdx(i);
    error(i) = abs((x(i+1)-x(i))/x(i+1))*100;
    if (tol>error)
        break;
    end
end

x = x(2:end);
end
