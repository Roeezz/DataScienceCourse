function pred = runsoftsvm(lambda, Xtrain, Ytrain, Xtest, Ytest, m, runs),
    
    for n = 1:15,
        w = trainsoftsvm(lambda, Xtrain, Ytrain,m, n);
    endfor
    
endfunction
