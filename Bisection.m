% Bisection Method
% @args
%   fnString -> Function in a string format
%   x1 -> start of the interval
%   x2 -> end of the interval
%   iterations -> number of iterations default = 50
%   tolerance -> step moved by the function default = 0.00001
% @return
%   root -> the value of the root of the function

function [root, error, n] = Bisection(fnString, x1, x2, iterations, tolerance)

if nargin < 4
    iterations = 50;
    tolerance = 0.00001;
elseif nargin < 5
    tolerance = 0.00001;
end

syms fn(x)
fn(x) = eval(fnString);

fx1 = fn(x1);
fx2 = fn(x2);

if fx1*fx2 > 0
    root = ('Error: The function has the same sign at the two given points');
else
    n = ceil((log10(x2-x1)-log10(tolerance))/log10(2));
    n = min(iterations, n);
    root = zeros(1, n);
    error = zeros(1, n);
    for i = 1:n
       root(i) = (x1+x2)/2;
       if i > 1
           error(i) = abs((root(i) - root(i-1))/root(i))*100;
       end
       fx = fn(root(i));
       if fx == 0
           break;
       end
       if fx1*fx < 0
           x2 = root(i);
       else
           x1 = root(i);
           fx1 = fx;
       end
    end
end
    
end