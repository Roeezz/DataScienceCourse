function error_on_softsvm_run = runsoftsvm2(lambda, Xtrain, Ytrain, Xtest, Ytest),
    errors = zeros(1,3);
    for i = 1:3
        w = trainsoftsvm(lambda.^(5*i), Xtrain, Ytrain,100);
        errors(i) = testsoftsvm(w,Xtest,Ytest);
    endfor
    error_on_softsvm_run = errors
endfunction
