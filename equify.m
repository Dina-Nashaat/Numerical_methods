function [x,error] = equify(x,error)

diff = abs(length(x)-length(error));
if length(x)<length(error)
    for i = 1:diff
        x = [x 0];
    end
else
    for i = 1:diff
        error = [error 0];
    end
end
