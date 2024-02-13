function [f] = vatyam_hw0_p3(n)
    %VATYAM_HW0_P3 Compute the Factorial of n using While Loop
    %   Detailed explanation goes here
    %   Error Checking
    if n < 0
        error('factorial is possible for whole numbers only');
    end
    % setting the default value as 1 for 0 factorial
    f = 1;
    % while loop to mutliply the number n by reducing it each time by 1
    while n > 0 %this is done till n is greater than 0
        f = f*n;
        n = n-1;
    end
end

