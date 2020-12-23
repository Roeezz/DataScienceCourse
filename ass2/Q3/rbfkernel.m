function output = rbfkernel(sigma,x1,x2)
    output = exp((-((norm(x1 - x2))^2)/(2*sigma)));
end
