function [l,v] = vatyam_hw6_p1(A,v0)
    %VATYAM_HW6_P1 Function to implement the Rayleigh-Quotient for eigenvale and eigen vectors 
    %   Use this method to find the eigen values and vectors without
    %   introducing a value close to mu.
    
    % Fix a tolerance value to reach a value closer to real eigen
    tol = 10^-8;
    % Calcualting the normalised eigen vector
    v = v0/norm(v0);
    % Calculating the initial eigen value
    l = (v)'*A*(v);
    % setting the initial diff to greater than tolerance
    diff = 1;
    % Iterating while the difference is greater than the tolerance
    while diff > tol
        % Solving the (A-lambda*I) to get a closer vector v
        v = (A - l*eye(size(A)))\v;
        % Normalising the vector
        v = v/norm(v);
        % Multiplying v transpose with A times v to get the eigen value
        la = v'*A*v;
        % Calculating the difference between the previous and the current
        % eigen value
        diff = abs((la - l)/la);
        % Storing the eigen value in l
        l = la;
    end
end

