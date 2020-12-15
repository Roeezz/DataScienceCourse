function [train_mean_errors, train_max_errors, train_min_errors, ...
    test_mean_errors, test_max_errors, test_min_errors] = runsoftsvm1(lambda, Xtrain, Ytrain, Xtest, Ytest),
    errors = zeros(1,10);
    for n = 5:15,
        disp("Run");
        disp(n-4);
        for i = 1:10,
            disp("Iteretaion");
            disp(i);
            w = trainsoftsvm(lambda.^n, Xtrain, Ytrain,100);
            train_error_run(i) = testsoftsvm(w, Xtrain, Ytrain);
            test_error_run(i) = testsoftsvm(w, Xtest, Ytest);
        endfor
        train_mean_errors(n-4) = mean(train_error_run);
        train_max_errors(n-4) = max(train_error_run);
        train_min_errors(n-4) = min(train_error_run);
        test_mean_errors(n-4) = mean(test_error_run);
        test_max_errors(n-4) = max(test_error_run);
        test_min_errors(n-4) = min(test_error_run);
    endfor
endfunction
