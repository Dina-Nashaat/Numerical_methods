function [ xr ] = Secant( f,a,b,tol,iter ) %The function , x(i-1) , x(i) , tolerance , maximum iterations
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tic;
%if tolerane = 0 , default tolerance = 0.00001 , and if maximum iterations
%= 0 , default maximum number of iterations = 50

if(tol==0)
    tol = 0.00001;
end
if(iter == 0)
    iter=50;
end




i=0;
error = 10; %initial error is big

c = ( a * f(b) - b*f(a))/(f(b) - f(a));

disp('     iteration     Xi-1     f(Xi-1)     Xi     f(Xi)     Xi+1     f(Xi+1)     ea\n');

while(error>tol && i<iter)
    i=i+1;
    
       fprintf('%3d   %f   %f   %f   %f   %f   %f   %e\n',i,a,f(a),b,f(b),c,f(c),error);
        
     a = b;
    b = c;
    c = (a*f(b) - b*f(a))/(f(b) - f(a));
    error = abs(f(c));
end

fprintf('Number of Iterations = %3d \n',i);

xr=c;
toc;
end

