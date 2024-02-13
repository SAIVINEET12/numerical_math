function [mu, V] = vatyam_final_p1(data)
    % VATYAM_FINAL_P1 Compute the mean and Covariance of the given dataset
    %   The mean is calculated by summing the columns and dividing by the
    %   total number of the data points and covariance is calculated by
    %   multiplying the corresponding data points and dividing by the
    %   number of samples - 1
    
    % storing the row size in n_sample and column size in n_data
    [n_sample, n_data] = size(data);
    % Calculating the column sum and storing as a column vector
    S = sum(data);
    % Creating a zeros column vector
    mu = zeros(n_data,1);
    % Looping through each column i.e different data points
    for i = 1:n_data
        % Storing the mean per column in the column vector
        mu(i,1) = S(i)/n_sample;
    end
    % Creating a zeros initial square matrix with size of n data points
    V = zeros(n_data,n_data);
    % Looping through the n data points
    for i = 1:n_data
        % Looping through n data points for relation with other data point
        for j = 1:n_data
            % Looping through the matrix element for each data sample
            for k = 1:n_sample
                % Summing the sample - mean * sample - mean of other data
                % sample to get the corresponding sum
                V(i,j) = V(i,j) + (data(k,i) - mu(i,1)) * (data(k,j)- mu(j,1));
            end
            % Obtaining the covariance by diving the current matrix element
            % with the number of samples - 1
            V(i,j) = V(i,j)/(n_sample - 1);
        end
    end
    
end

