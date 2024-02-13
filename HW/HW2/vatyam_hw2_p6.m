function [val] = vatyam_hw2_p6(x,f)
    %VATYAM_HW2_P6 Integral By Left-Point Approximation
    
    % Use the function call in the form of vatyam_hw2_p6(x, f)
    
    %   Integration is done by the formula (b-a)f(a) over small intervals 
    %   where b and a are the upper limit and the lower limits and f(x) is 
    %   the function to be integrated
    
    % Initialise the value to 0
    left_val = 0;
    
    % Iterating through the loop to iterate through elements in the list
    for i =  1:length(x)-1
        
        % Using the Reimann Sum, we integrate through smaller pieces to
        % reduce the error to O(h) and storing it to left_val
        left_val = left_val + (x(i+1) - x(i)).*(f(i));
        
    end
    
    %Storing the Final Result in val
    val = left_val;
end

