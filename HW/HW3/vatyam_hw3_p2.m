function [f,J] = vatyam_hw3_p2(x)
    % VATYAM_HW3_P2 Function that returns the Residual Vector and Jacobian
    % matrix
    %   zeroes function and fsolve function is used to find the roots of
    %   the equation and Jacobian is computed manually and the values are
    %   substituted in the matrix, depending on the values of X0
    
    % The non-linear equations are as follows:
    f(1) = x(1) + x(2) + x(3) - 1;
    f(2) = x(1)^2 + x(2) + x(3)^2 - 5;
    f(3) = exp(x(3)) + x(1)*x(2) - x(1)*x(3) - 1;
    f = [f(1);f(2);f(3)];
    
    % Jacobian Matrix computed manually and gives results based on the
    % values of the intial vector X
    J = [1 1 1 ; 2*x(1) 1 2*x(3) ; (x(2)-x(3)) , x(1) , (exp(x(3))-x(1))];
    
end

