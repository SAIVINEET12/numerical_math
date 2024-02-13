function [x] = vatyam_hw2_p7(f,a,b,tol)
    % VATYAM_HW2_P7 Function to determine the root of a single-variable
    % function using the Bi-section method
    
    %   By using the Intermediate Value Theorem to converge the fucntion in
    %   a given range and reach the f(m) inside a specified tolerance to
    %   give the result
    

    % Initialising the value of P to iterate when true
    p = 1;
    % While loop iterates until the value of p reaches 0 , i.e the function
    % value at m (f(m)), reaches the specified tolerance limit
    while p == 1
        % Setting the value of m as the midpoint of the range [a,b]
        m = (b+a)/2;
        
        % Checking if f(m) is within the tolerance value and if it is then
        % storing the value in s and stopping the loop
        if abs(f(m)) < tol
            s = m;
            p = 0;
        
        % Checking if the f(a)*f(m) < 0 and then shrinking the range [a,b]
        % to [a,m] by placing the new value of b as m and continuing the
        % loop for futher check
        elseif f(a)*f(m) < 0
            a = a;
            b = m;
            p = 1;
            m = (a+b)/2;
            
        % Checking if the f(b)*f(m) < 0 and then shrinking the range [a,b]
        % to [m,b] by placing the new value of a as m and continuing the
        % loop for futher check
        elseif f(m)*f(b) < 0
            b = b;
            a = m;
            p = 1;
            
        end
        
    end
    %Storing the value of s in the function result x
    x = s;
        
end

