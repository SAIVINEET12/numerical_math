function [B] = vatyam_hw6_p4(A,p)
    %VATYAM_HW6_P4 Function to calculate the best rank-p approximation
    % performing SVD to get singular values S, left singular matrix U and V the right singular matrix   
    [U, S, V] = svd(A);
    res = zeros(size(A));
    for i = 1:rank(A)
        % Assigning thenvalues lower than 10^-10 to 0
        if S(i,i) < 1e-10
            S(i,i) = 0;
        end
    end
    % CHecking if the rank to be approximated is greater than the minimum size of
    % the matrix A
    if p > rank(A)
        % Returning the matrix A as B if p > min(size(A))
        B = A;
    else
        % Creating a low rank approximation by multiplying singualr values
        % looping till the pth singular value
        for i = 1:p
            res = res + S(i,i)*U(:,i)*V(:,i)';
        end
        B = res;
    end
end

