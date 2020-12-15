function error_on_softsvm_run = runsoftsvm1(lambda, Xtrain, Ytrain, Xtest, Ytest),
    errors = zeros(1,10);
    for n = 5:15,
        error_run = zeros(1,10);
        for i = 1:10,
            w = trainsoftsvm(lambda.^n, Xtrain, Ytrain,100);
            error_run(i) = testsoftsvm(w,Xtest,Ytest);
        endfor
        errors(n-4) = mean(error_run)
    endfor
    error_on_softsvm_run = errors
endfunction
