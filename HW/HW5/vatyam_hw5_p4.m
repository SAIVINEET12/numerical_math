% Script to plot the time taken to perform QR Decomposition vs the size of
% the matrix for various forms of QR

% Initialising the Norm vector obtained by the classical QR method
C = zeros(11);
% Initialising the Norm vector obtained by the modified QR method
M = zeros(11);
% Initialising the Norm vector obtained by the Householder QR method
R = zeros(11);
% Initialising the Norm vector obtained by the QR function in matlab
O = zeros(11);
% Looping over 2 to 11 to create a hilbert matrix of dimensions 2 to 11
for i = 2:11
    % Storing the Hilbert matrix in H
    H = hilb(i);
    % Storing the Q and R obtained by classical QR method in [a,b]
    [a,b] = qr_classical(H);
    % Storing the norm of the (transpose(Q)*Q - I) in C
    C(i) = norm(a'*a - eye(i));
    % Storing the Q and R obtained by Modified QR method in [a,b]
    [a,b] = qr_modified(H);
    % Storing the norm of the (transpose(Q)*Q - I) in M
    M(i) = norm(a'*a - eye(i));
    % Storing the Q and R obtained by Householder QR method in [a,b]
    [a,b] = qr_householder(H);
    % Storing the norm of the (transpose(Q)*Q - I) in R
    R(i) = norm(a'*a - eye(i));
    % Storing the Q and R obtained by QR matlab function in [a,b]
    [a,b] = qr(H);
    % Storing the norm of the (transpose(Q)*Q - I) in O
    O(i) = norm(a'*a - eye(i));
end   
% Plotting the graph between size of the matrix and the norm obtained
semilogy(2:11,C(2:11));
hold on
semilogy(2:11,M(2:11));
hold on
semilogy(2:11,R(2:11));
hold on
semilogy(2:11,O(2:11));
hold off
xlabel('Size of Matrix');
ylabel('Norm of QR decomposition')
% Creating legends table to identify the curve in the plot
legend('Classical','Modified','Household-Reflector','Through Matlab QR')