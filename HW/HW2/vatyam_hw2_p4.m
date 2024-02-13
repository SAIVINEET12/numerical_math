function [l] = vatyam_hw2_p4(x, i , xList)
    % VATYAM_HW2_P4 function that returns the i-th Lagrange Polynomial
    % evaluated at x from a list of x - locations
    
    % Using the largrange polynomial function of pi((x-x(i))/(x(j)-x(i)))
    % for all values where i ~= j to get the output in l
    
    % Initialising the lagrange polynomial to 1 to use it recursively
    p = 1;
    
    % Throwing an error when asked order of the lagrange polynomial is more
    % than the max order lagrange that can be formed
    if i > length(xList)
        error('The max i value of the given xList is %d',length(xList))
    end
    
    % Iterating over all the values of the xList
    for k = 1:length(xList)
        % Multiplying only when k is not equal to i as if included the
        % product becomes 0
        if k~=i
            
            % Recursive multiplication till it reaches the end of the List
            p = p * (x - xList(k))/(xList(i) - xList(k));
            
        end
    end
    
    % Storing the result in the output l
    l = p;
end

