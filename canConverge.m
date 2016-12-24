function [yes] = canConverge(fnString, root)

func = sym(fnString);
dfunc = diff(func);
x = subs(dfunc, root);
if x<1
    yes = 1;
else 
    yes = 0;
end

