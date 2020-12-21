function best_hyper_parameters = cross_validate(Xtrain,Ytrain)
    div_idx = floor(linspace(0,size(Xtrain,1),6));
    best_val_error = Inf;
    best_hyper_parameters[-1,-1];
    for sigma = [0.01,0.05,1],
        gram_matrix = calc_gaussian_gram_matrix(sigma, Xtrain);
        for lambda = [1,10,100],
            for i = 1:5,
                val_range = div_idx(i)+1:div_idx(i+1);
                train_range = [1:div_idx(i), div_idx(i+1)+1:size(Xtrain,1)];
                
                Yval = Ytrain(val_range);
                Xsample = Xtrain(train_range,:);
                Ysample(train_range);
                alpha = softsvmrbf(lambda, sigma, Xsample, Ysample);
                sub_gram_matrix = gram_matrix(train_range, val_range);
                errors(i) = error_on_kernel_softsvm(alpha, sub_gram_matrix,Yval);
            end
            val_error = mean(errors);
            if val_error < best_val_error,
                best_val_error = val_error;
                best_hyper_params = [sigma, lambda];
            end
        end
    end
end
