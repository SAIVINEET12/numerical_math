function [data] = vatyam_final_p2(nSamples, F, mu, sigma)
    % Determing a theoritical model from the Monte Carlo Method
    %   Creating a data set with nSamples and nInput rows using the mean
    %   and standard deviation
    
    % Computing the size of the mean vector and assigning it to nInput
    [nInput,m] = size(mu);
    % Creating a inVal matrix initialised with zeros
    inVal = zeros(nSamples,nInput);
    % Looping over nInput columns size to create a nSample column vector
    for i = 1:nInput 
        % Storing the nSample distribution in vector a
        a = normalRand(nSamples,mu(i,1),sigma(i,1));
        for j = 1:nSamples
            % Storing the elements in a as a column in inVal
            inVal(j,i) = a(j,1);
        end
    end
    % Fuction F operated on inVal to get outVal
    outVal = F(inVal);
    % Storing the outVal in data
    data = outVal;
    
end

