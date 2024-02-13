function[a, n] = untitled2(fdf, a0, x, y, tol)
    solutionExists = false;
    alpha = 1;
    maxAlphaIter = 10;
   
    for iter=0:100
        [currentResidual, J] = fdf(a0, x, y);
        delta = -(J \ currentResidual);
        if norm(delta) < tol
            solutionExists = true;
            a = a0;
            n = iter;
            break;
        end
       
        if iter > 0 && maxAlphaIter > 0 && (norm(currentResidual) >= norm(prevResidual))
            alpha = alpha * 0.5;
            maxAlphaIter = maxAlphaIter - 1;
        end
       
        prevResidual = currentResidual;
        a0 = a0 + (alpha * delta);
    end
    if ~solutionExists
        error("Error happened");
    end
end