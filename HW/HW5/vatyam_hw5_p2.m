% Script to plot the Operation time for LU-decomposition vs Matrix Size
% Creating a vector of equally spaced dimensions between 10 and 10000
n = round(logspace(1,4));
% Initialising the Time matrix with zeros
T = zeros(1,50);
% Iterating through the elements of the n vector that contains the size
for i = 1:50
    % Generating a random n*n matrix which is strictly diagonal dominant
    A = rand(n(i),n(i)) + n(i)*eye(n(i));
    % Starting the time for calculating the time to perform LU decomposition
    tic;
    % Calling the function to perform LU decomposition on A
    [L,U,P] = lu(A);
    % Storing the time taken in the T vector
    T(i) = toc;
    % Calculating the theoritical time to perform LU decompostiion
    S(i) = (2*((n(i))^3)/6)-((n(i)^2)/2)-(n(i))/6;
end
% Scaling the theoritical time to be close to the computed time by
% multiplying S with 10^(-10) to rescale it
R = S*0.0000000001;
s
T
% Log-log graph to plot the time taken vs the size of the matrix
loglog(n,T);
hold on
% Log-log graph to plot theoritical time vs the size of the matrix
loglog(n,R)
xlabel('Size of Matrix');
ylabel('Computation Time')
% Legend table to identify the curves in the plot
legend('manual code time','scaled analytic long-term')