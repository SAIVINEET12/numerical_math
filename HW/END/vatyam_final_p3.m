function [L,V,scores] = vatyam_final_p3(data,MuCovF)
    % Function to determine PCA analysis of the given dataset
    %   TO calculate the principal components, directions and scores
    
    % Storing the mean and Covariance obtained through the function MuCovF
    [mu,Cov] = MuCovF(data);
    % % storing the row size in n_sample and column size in n_data
    [n_data,n_sample] = size(data);
    % Initialising a data matrix with zeros
    D = zeros(n_data,n_sample);
    % Looping through the data points to subtract the mean from it
    for i = 1:n_data
        % Looping through the samples in the row form
        for j = 1:n_sample
            % subtracting the mean of the column from the data sample
            D(i,j) = data(i,j) - mu(j);
        end
    end
    % Determining the eigen vectors and eigen values of the covariance
    % matrix using the eigs function
    [V,P] = eigs(Cov);
    % Finding the size of the covariance matrix
    [m,n] = size(Cov);
    % Initialsing a column vector with zeroes
    L = zeros(m,1);
    for i = 1:m
        % Storing the eigen value elements in the column vector
        L(i,1) = P(i,i);
    end
    % Computing the scores matrix by multiplying the centered data with the
    % principal vectors
    scores = D*V;
end

