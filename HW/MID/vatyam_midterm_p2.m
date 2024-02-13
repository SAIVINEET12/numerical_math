function [a,n] = vatyam_midterm_p2(fdf, a0, x, y, tol)
    % Summary of this function goes here
    %   Detailed explanation goes here
    
    alpha = 1;
    [f,J] = fdf(a0, x, y);
    delta = -(J\f);
    i = 1;
    p = f;
    af = a0 + alpha * delta;
    
    while i <= 100
        if vecnorm(delta) < tol 
            a = af;
            n = i;
            break
        else
            
            [f,J] = fdf(af,x,y);
            inner_count = 1;
            
            while inner_count <=10
                if vecnorm(f) > vecnorm(p)
                    delta = -(J\f);
                    alpha = alpha/2;
                    af = af + alpha*delta;
                    p = f;
                    [f,J] = fdf(af,x,y);
                
                    
                end
                inner_count = inner_count + 1;
            end
            delta = -(J\f);
            af = af + alpha*delta;
            i = i + 1;
            
        end
    end
    if i == 101
        error('No convergence');
    end
end