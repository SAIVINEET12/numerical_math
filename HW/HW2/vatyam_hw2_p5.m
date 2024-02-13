% Call the function as vatyam_hw2_p5(@vatyam_hw2_p4 , x , xlist , ylist)

function [f] = vatyam_hw2_p5(L,x,xList,yList)
    % VATYAM_HW2_P5 Function to evaluate the interpolating polynomial at the
    % location x given the data pairs xList and yList.
    
    % Using the previous function to calculate the i-th lagrange polynomial
    % and then multiply it with the corresponding y in the yList through
    % the whole list gives the required result
    
    % Initialising the result value to 0
    k = 0;
    % iterating through the whole list to create a lagrange polynomial
    % interpolation function
    for i = 1:length(xList)
        
        % Using function handle to save the value of the lagrange polynomal
        % in s 
        s = L(x, i , xList);
        % Recurrsive adding to get the final interpolating result as the
        % interpolant is equal to y1*L1(x) + y2*L2(x) + .... + yn*Ln(x)
        k = k + yList(i)* s;
    end
    % Storing the value of result to value f
    f = k;
end

