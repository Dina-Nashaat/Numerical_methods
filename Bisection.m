%% Bisection Method
% @args
%   fnString -> Function in a string format
%   x1 -> start of the interval
%   x2 -> end of the interval
%   tolerance -> step moved by the function
% @return
%   root -> the value of the root of the function

function root = Bisection(fnString, x1, x2, tolerance)

syms fn(x)
fn(x) = eval(fnString);

fx1 = fn(x1);
fx2 = fn(x2);

if fx1*fx2 > 0
    root = ('Error: The function has the same sign at the two given points');
else
    n = ceil((log10(x2-x1)-log10(tolerance))/log10(2));
    for i = 1:n
       root = (x1+x2)/2;
       fx = fn(root);
       if fx == 0
           break;
       end
       if fx1*fx < 0
           x2 = root;
       else
           x1 = root;
           fx1 = fx;
       end
    end
end
    
end