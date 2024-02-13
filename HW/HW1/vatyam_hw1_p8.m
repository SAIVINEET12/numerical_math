function [num] = vatyam_hw1_p8(A,i,j,n)
    % Function to determine total number of paths <= length n b/w two points
    % creating a loop that ends at the matrix multiplication A^n which
    % corresponds to length n and hence adding the element in A(i,j) which
    % denote the number of paths of that particular length
    
    % Initialising k as 1 (taking it as A^1)
    k = 1;
    % Counter for counting number of paths for a given length k
    count = 0;
    % Storing Adjacency Matrix A in M for iterating and matrix multiplication 
    M = A;
    
    % Iterating through the matrix till A^n (as n is the max length)
    while k <= n
        
        % Checking if the path is non zero
        if M(i,j) > 0
            % adding number of the paths to the counter as M(i,j) indicates
            % the number of paths of length k
            count = count + M(i,j);
            % Matrix multiplication for the next iteration
            M = M*A;
            % Incrementing the length k till it reaches n
            k = k + 1;
        
        % Runs when zero paths are present for a given length
        else
            % incrementing length till n
            k = k + 1;
            % Matrix multiplication for the next loop to check non zero paths
            M = M*A;
            
        end
        
    end
    
    % Saving the total number of paths stored in count as num
    num = count;
    
end

