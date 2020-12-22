function validation_error = validate_kernel_softsvm(alpha, sigma, Xsample, Xval,Yval)
    Ypredictions = zeros(size(Xval,1),1);
    for j = 1:size(Xval,1)
        for i = 1:size(Xsample,1)
            Ypredictions(j) = Ypredictions(j) + alpha(i)*rbfkernel(sigma, Xsample(i,:), Xval(j,:));
        end
        Ypredictions(j) = sign(Ypredictions(j));
    end
    validation_error = mean(Yval ~= Ypredictions);
end