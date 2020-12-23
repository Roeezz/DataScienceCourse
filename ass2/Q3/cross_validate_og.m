function best_hyper_param = cross_validate_og(Xtrain,Ytrain)
    div_idx = floor(linspace(0,size(Xtrain,1),6));
    best_val_error = Inf;
    disp("Starting cross validation")
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
            w = softsvm(lambda, Xsample, Ysample);
            errors(i) = testsoftsvm(w, Xval, Yval);
            fprintf("End run number %d\n", i);
        end
        errors
        val_error = mean(errors)
        if val_error < best_val_error
            best_val_error = val_error;
            best_hyper_param = lambda;
        end
    end
end
