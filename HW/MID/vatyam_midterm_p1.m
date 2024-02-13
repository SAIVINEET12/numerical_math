function [a,n] = vatyam_midterm_p1(fdf, a0, x, y, tol)
    % VATYAM_MIDTERM_P1 Non-Linear Regression function based on the Gauss-Newton Algorithm 
    % Gauss Newton method uses converegence of delta as the criteria to
    % provide non linear regression, it also uses the wolfe conditions to
    % determine the damping coefficient for further iterations
    
    % Storing the initial coefficients in af
    af = a0;
    % Using fdf function to determine the residual vector and storing it in
    % f and also determining the Jacobian matrix and storing it in J 
    [f,J] = fdf(af,x,y);
    % Determining the full step delta
    delta = -J\f;
    % Initializing the counter as 1 for the iterations
    count = 1;
    % Iterating till a max value of 100 or stop when the required tolerance
    % criteria is met
    while count <= 100
        
        % Checking whether the norm of delta is less than the tolerance
        if norm(delta) < tol
            % Storing the result in the output a
            a = af;
            % Storing the number of iterations taken for convergence in n
            n = count;
            % Breaking the loop if the condition is met
            break;
        else
            % Initializing the damping coefficient as 1 (full step)
            alpha = 1;
            % Creating an inner counter for finding the optimal damping
            % coefficient
            inner_count = 1;
            % Iterating till the criteria is met or till a max of 10
            % iterations
            while inner_count <= 10
                % Storing the residual vector and Jacobian of the
                % coefficients vector at a particular iteration in l and M
                [l,M] = fdf(af,x,y);
                
                % Storing the residual vector and Jacobian of the
                % coefficients vector at a given damping value which is to
                % be checked as optimal
                [p,Q] = fdf(af + alpha*delta,x,y);
                
                % If the norm of the previous iteration is less than that
                % of the current iteration(with damped alpha), reduce the
                % alpha by one-half
                
                if norm(p) > norm(l)
                    
                    % Cutting the alpha by one-half
                    alpha = alpha/2;
                    % incrementing the inner count for optimal alpha value
                    inner_count = inner_count + 1;
                else
                    % If the norm of previous iteration is more than the
                    % current iteration(with damped alpha), then the loop
                    % is broken
                    break;
                end
            end
            
            % Taking the next coefficients in the direction of delta*alpha
            af = af + alpha*delta;
            % Storing the resultant residual and jacobian in f and J
            [f,J] = fdf(af,x,y);
            % Finding the new delta
            delta = -J\f;
            % Incerementing the main counter for a max of 100 iterations
            count = count + 1;
            
        end
    end
    % Outputting the error if the convergence is not found even after 100
    % iterations
    if count == 101
        error('No convergence has been found');
    end
    
end

