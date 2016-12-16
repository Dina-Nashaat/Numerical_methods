function [ xr,error,i ] = False_Position( fn,xl,xu,es,iter ) %The function , lower bound , upper bound , accuracy
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
fl = fn(xl);
fu = fn(xu);

%xr = xu-fu*(xl-xu)/(fl-fu);


xr(1) = xu - (xl - xu ) / (fl - fu ) ;          
fr = fn(xr);

error(1) = 10;  %initial error is big
t = linspace(xu,xl,1);

f=fn(t);
%fig=figure();


%plot(t,f)


%Doesn't plot the figure

%hold on
%set(fig,'color','white')
%grid on

fprintf('   iter     x1     xr     xu      f(xr)     ea\n');

i = 1;
while(error(i)>es && i<iter)
   %plot([xu xl],[fu fl],'r--')
    %pause
    %Remove the 'pause' comment for single step mode
   fprintf('%3d %12.8f %12.8f %12.8f %12.3e %12.3e\n',i,xl,xr(i),xu,fr,error);
   xr(i+1) = xu-fu*(xl-xu)/(fl-fu);
   fr = fn(xr(i+1));
   if(sign(fr)==sign(fl))
       xl = xr(i+1);
       fl = fr;
   else
       xu = xr(i+1);
       fu = fr;
   end
   error(i+1) = abs(fr);
   i=i+1;
end

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
%     xrold = xr;
%     plot([xu xl],[fu fl],'r--')
%     pause
%     
%     fr= fn(xr);
%     
%     fprintf('%3d %12.8f %12.8f %12.8f %12.3e %12.3e\n',i,xl,xr,xu,fr,ea);
%     
%     if fl*fr<0
%         xu = xr;
%         
%     else if fl*fr>0 
%             xl = xr;
%         else
%             break
%         end
%     end
%     
%     i=i+1;
%     fl=fn(xl);
%     fu=fn(xu);
%     
%     xr = xu - (xl - xu ) / (fl - fu ) ;
%     
%     %ea = abs((xr-xrold)/xr);
%     ea = abs(fr);
% end
i=i-1;

fprintf('the iteration number is %d\n',i);
fprintf('the root of the function is %f\n',xr(i+1));



end
