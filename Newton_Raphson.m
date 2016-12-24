function [fx x error i] = Newton_Raphson(start, fnString, iter, tol)
% Get the root of non-linear functions using Newton Raphson Method
%iter = 0;
%maxit = 3;

func = sym(fnString);
conv = canConverge(fnString, start);
conv2 = canConverge2(fnString, start);

if conv == 1 
    dfunc = diff(func);
    x = zeros(1,iter);
    error = zeros(1, iter);
    x(1) = start;
    fx = zeros(1,iter);
    fdx = zeros(1,iter);

    for  i = 1:iter  
        iter = iter + 1;
        fx(i) = subs(func, x(i));
        fdx(i) = subs(dfunc, x(i));
        x(i+1) = double(x(i)) - fx(i)/fdx(i);
        error(i) = abs((x(i+1)-x(i))/x(i+1))*100;
        if (tol>error(i)) 
            break;
        elseif (isnan(error(i))) || (isnan(x(i+1)))
            i = i-1;
            break;
        end
    end
    [x,error] = equify(x(2:i+1),error(1:i));
elseif conv == 0
    msgbox('Function can''t converge, function diff is less than zero');
end
