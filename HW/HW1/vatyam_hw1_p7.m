function [length] = vatyam_hw1_p7(A,i,j)
    % Function to determine the minimum path length to connect 2 points
    % creating a while loop that breaks when the element A(i,j) > 1 
    % And now place a counter for the matrix multiplication which is length
    
    % Storing the value of Adjacency Matrix A in M
    M = A;
    % Initialising the value of K as 1 default length if no error occurs
    k = 1;
    % Initialising count as 1 for iterating 20 times maximum 
    count = 1;
    % Iterating the matrix so as to find the length of path
    % Path length is n in A^n when the A(i,j) is non-zero
    while count <= 20
        % Checking if the element is non-zero
        if M(i,j) > 0
            % Storing the value of k in the length
            length = k;
            % Break the statement as only the minimum path length is needed
            break;
            
        % If A(i,j) is zero, we do matrix multiplication
        else
            % multiplying the matrix M with A each time a zero is found
            M = M*A;
            % Incrementing the length as length is n in A^n
            k = k + 1;
            % Counter increment to stop the iteration after 20 times
            count = count + 1;
    
        end
    end
    
    % Printing error if the paths cannot be formed after 20 iterations
    if count == 21
        error("The 2 points cannot be connected");
    end
    
end

