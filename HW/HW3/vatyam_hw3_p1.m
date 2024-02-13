function [x] = vatyam_hw3_p1(fdf, x0 , tol)
    % VATYAM_HW3_P1 Function that determines the root of a non-linear system
    % using undamped Newton-Rhapson method
    % Root of the system is computed by checking the convergence of the
    % function ||f(x)|| < tol by iterating to find x1 = x0 - J\f(x)
    
    % getting the intial residual vector and Jacobian matrix using function
    % handle fdf
    [f, J] = fdf(x0);
    
    % finding the next closer root by using the Newton - Rhapson formula
    p = x0 - J\f;
    % Using i as counter to limit the number of iterations to 100 
    i = 1;
    % checking the value of i to continue iteration
    while i <= 100
        % finding the residual and Jacobian for the next x
        [f , J] = fdf(p);
        % Checking the convergence criteria for the root finding
        if vecnorm(f) < tol
            % Assigning the value of p to x as the result vector
            x = p;
            break
        % continuing the iteration if converegence is not under the
        % tolerance limit
        else
            % incrementing the counter
            i = i + 1;
            % Finding the next closer root
            p = p - J\f;
        end
        
    end
    % If counter reached 100 iterations, meaning no convergence of the
    % system of functions , hence no root 
    if i == 101
        error('There is no convergence and hence root cannot be found using the Newton-Rhapson method.')
    end
    
end

