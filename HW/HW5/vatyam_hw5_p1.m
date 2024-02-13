function [L,U,P] = vatyam_hw5_p1(A)
    %VATYAM_HW5_P1 Function to compute the LU-decomposition
    %   Perform the LU-decomposition of A with Partial Pivoting without the
    %   use of inbuilt functions 
    
    % Storing the size of the matrix in a vector
    d = size(A);
    % Finding n of the matrix 
    n = d(1);
    % Initializing the U matrix as A
    U = A;
    % Initialising the P matrix as an Identity matrix
    P = eye(n);
    % Initialising the L matrix as an Identity matrix
    L = eye(n);
    % Iterating through the the matrix U till the 2nd last element
    for k = 1:n-1
        % Finding the maximum value of the element in the column
        pivot=max(abs(U(k:n,k)));
        % Zero pivot check
        if pivot > exp(-8)
            % Iterating through the elements in the column
            for i = k:n
                % Finding the index pf the pivot matrix
                if abs(U(i,k)) == pivot
                    % Storing the index of the pivot
                    index = i;
                    break;
                end
            end
            % Swapping the rows after the index is found
            U([k,index],k:n) = U([index,k],k:n);
            % Swapping the rows of the matrix with the highest value row
            L([k,index],1:k-1) = L([index,k],1:k-1);
            % Swapping the rows similar to the previous swaps
            P([k,index],:) = P([index,k],:);
            % Iterating through the elements below after swapping
            for j = k+1:n
                % Gaussian Elimination operation
                L(j,k) = U(j,k)/U(k,k);
                U(j,k:n) = U(j,k:n)-L(j,k)*U(k,k:n);
            end
        end
    end    
end

