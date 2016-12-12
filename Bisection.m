%% Bisection Method
% @args
%   fnString -> Function in a string format
%   x1 -> start of the interval
%   x2 -> end of the interval
%   iterations -> number of iterations default = 50
%   tolerance -> step moved by the function default = 0.00001
% @return
%   root -> the value of the root of the function

function root = Bisection(fnString, x1, x2, iterations, tolerance)

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