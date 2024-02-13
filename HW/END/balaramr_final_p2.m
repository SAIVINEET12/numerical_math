function [data] = balaramr_final_p2(nSamples, F, mu, sigma)
    [~, cols] = size(mu);
    arr = zeros(nSamples, cols);
    for col=1:cols
        guassianDistribution = normalRand(nSamples, mu(1,col), sigma(1,col));
        for i=1:nSamples
            arr(i, col) = guassianDistribution(i, 1);
        end
    end
    data = F(arr);
end
