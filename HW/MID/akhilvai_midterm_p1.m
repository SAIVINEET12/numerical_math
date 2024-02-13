function [a,n] = akhilvai_midterm_p1(fdf, a0, x, y, tol)
    % akhilvai_midterm_p1 of this function goes here
    %   Detailed explanation goes here
    
    % external function which returns residual vector and Jacobian matrix
    [f,J] = fdf(a0, x, y);
    
    % solving and assigning product of residual vector and J inverse 
    delta = -J\f;
    
    % initializing counter as 1
    i = 1;  
    
    % damping factor
    alpha = 1;
    
    % solving for coefficient vector
    af = a0 + alpha * delta;
    inner_count = 1;
    % checking upto 100 iterations
    p = f;
    while i <= 100
        
        % checking for convergence
        if vecnorm(delta) < tol 
            % output of converged co-efficients array 
            a = af;
            % output of number of iterations took to converge
            n = i;
            break
            
        else
           
            % external function which returns residual vector and
            % Jacobian matrix           
            [f,J] = fdf(af,x,y);
          
            % checking if updated residual norm is greater than
                % previous residual norm
            if vecnorm(f) > vecnorm(p) 
            
                 % checking condition upto 10 iterations
                if inner_count <= 10
                    
                    % if the above condition is true, then damping factor
                    % is reduced by half
                    alpha = alpha/2;
                   
                    % increasing the inner count by 1
                    inner_count = inner_count + 1;
                else
                    break
                end
                
            end
            
            delta = -J\f;
            % solving for coefficient vector
            af = af + alpha * delta;
            % increasing the counter by 1
            i = i + 1;
            % previous residual vector to p 
            p = f;
            
        end
    end
    % checking if the number of iterations are greater 100
    if i == 101
        % error message as it didn't converged in 100 iterations
        error('No convergence within 100 iterations');
    else
        % if converged within 100 iterations,coefficient array and
        % number of iterations as output
        a = af;
        n = i;
    end
end