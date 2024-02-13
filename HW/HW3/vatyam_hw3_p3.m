function [x,f] = vatyam_hw3_p3(fun, x0, tol, maxIter)
    % Function that uses the damped-Newton method for minimization to
    % determine the minimum and it's location of a generic function
    
    % Checking the convergence criteria by a ||g||2 < tol with a constant
    % damping coefficient of alpha = 0.75 where g is the vector norm of the
    % gradient
    
    % Fixed damping coefficient as alpha = 0.75 
    alpha = 0.75;
    % Function handle to the function to be minimized, with f as the
    % objective function, g is the gradient of the objective function and
    % H is the Hessian of the objective function
    [f,g,H] = fun(x0);
    % Finding the next closer minimum x by the Damped Newton method
    p = x0 - alpha*(H\g);
    % Initialising the counter for max iterations as 1
    count = 1;
    % iterating upto a max value of max Iterations
    while count <= maxIter
        [f,g,H] = fun(p);
        % Convergence criteria is the 2-norm of the gradient vector
        if vecnorm(g) < tol
            % Finding solution if the convergence criteria has been met
            x = p;
            f ;
            break;
        % If the convergence criteria has not been met, then further
        % iterations are done and new f,g and H are calculated
        else
            count = count + 1;
            p = p - alpha*(H\g);
        end
    end
    % If the number of iterations is more than the max iterations error is
    % printed 
    if count == maxIter + 1
        
        error('The function does not converge in the given number of iterations');
        
    end
    
end

