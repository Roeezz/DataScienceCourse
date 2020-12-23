function best_hyper_params = cross_validate_rbf(Xtrain,Ytrain)
    div_idx = floor(linspace(0,size(Xtrain,1),6));
    best_val_error = Inf;
    disp("Starting cross validation")
    for sigma = [0.01,0.5,1]
        fprintf("Sigma = %f ", sigma);
        for lambda = [1,10,100]
            fprintf("Lambda = %f", lambda);
            errors = zeros(1,5);
            for i = 1:5
                sprintf("Run number %d", i);
                val_range = div_idx(i)+1:div_idx(i+1);
                train_range = [1:div_idx(i), div_idx(i+1)+1:size(Xtrain,1)];
                Xval = Xtrain(val_range,:);
                Yval = Ytrain(val_range);
                Xsample = Xtrain(train_range,:);
                Ysample = Ytrain(train_range);
                alpha = softsvmrbf(lambda, sigma, Xsample, Ysample);
                errors(i) = validate_kernel_softsvm(alpha, sigma, Xsample, Xval, Yval);
                fprintf("End run number %d\n", i);
            end
            errors
            val_error = mean(errors)
            if val_error < best_val_error
                best_val_error = val_error;
                best_hyper_params = [lambda, sigma];
            end
        end
    end
end
