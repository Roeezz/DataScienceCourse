function [train_errors, test_errors] = runsoftsvm2(lambda, Xtrain, Ytrain, Xtest, Ytest),
    errors = zeros(1,3);
    for i = 1:3
        disp("Run");
        disp(i);
        w = trainsoftsvm(lambda.^(5*i), Xtrain, Ytrain,1000);
        train_errors(i) = testsoftsvm(w, Xtrain, Ytrain);
        test_errors(i) = testsoftsvm(w, Xtest, Ytest);
    endfor
endfunction

save(run2_data.mat, train_errors, test_errors);