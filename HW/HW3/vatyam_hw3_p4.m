function [f,g,H] = vatyam_hw3_p4(x)
    %VATYAM_HW3_P4 Rosenbrock function for optimization algorithms
    %   Function that calculates the [f,g,H] of the function at x
    
    % Objective function
    f = (1-x(1))^2 + 100*(x(2) - x(1)^2)^2;
    % Gradient of the function
    g = [2*x(1)-2 + 400*x(1)^3 - 400*x(1)*x(2) ; 200*x(2) - 200*x(1)^2];
    % Hessian of the function
    H = [2 + 1200*x(1)^2 - 400*x(2) , -400*x(1) ; -400*x(1) , 200];
    
    
    
    
end

