function [f] = vatyam_hw0_p2(n)
    %VATYAM_HW0_P2 CODE TO COMPUTE FACTORIAL OF n USING A FOR LOOP
    %   multiplying the number n with n-1 , and so on till we reach 1
    
    %error checking
    if n < 0
        error('Factorial is possible for whole numbers only')
    end
    
    % Storing default fact value as 1 for 0 and 1
    f = 1; 
    % multiplying the numbers from 2 to n and storing it in f
    if n >= 2
        for ii = 2:n
            f = f*ii;
        end
    end
    
end

