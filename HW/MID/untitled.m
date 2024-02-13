function [a,n] = untitled(fdf,a0,x,y,tol)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    
    [f,J] = fdf(a0,x,y);
    d = -J\f;
    i = 1;
    k = a0;
    alpha = 1;
    p=1;
    while p==1
        if i==101
            break;
        if norm(d) < tol
            a = k;
            n = i;
            p=0;
            break;
        
        else
            k = k + alpha*d;
            [f,J] = fdf(k,x,y);
            d = -J\f;
            i = i + 1;
            n = 1;
        end
    end
    
end

