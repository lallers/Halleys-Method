function [x,xerr,ferr,k] = halley(f,df,d2f,x0,xtol,ftol,kmax)
%Notes: Does not have functionality for f'' being a constant

tic
k = 0;

[x,xerr,ferr,k] = halleysr(f,df,d2f,x0,xtol,ftol,k,kmax);
    function [x,xerr,ferr,k] = halleysr(f,df,d2f,xn,xtol,ftol,k,kmax)
        k = k + 1;
        x = xn - (2 .* f(xn) .*df(x0) )./ (2 .* (df(xn)).^2 - f(xn).*d2f(x0));
        xerr = abs(xn-x);
        
        if k >= kmax
            ferr = '';
            t = toc;
            fprintf('Maximum iterations met (%.02fs).',t)
        elseif xerr <= xtol
            ferr = '';
            t = toc;
            fprintf('Tolerance met at %g iterations (%.02fs)',k,t)
            return
        else
            [x,xerr,ferr,k] = halleysr(f,df,d2f,x,xtol,ftol,k,kmax);
        end
    end
    
end