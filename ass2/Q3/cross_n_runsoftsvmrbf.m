function test_error = cross_n_runsoftsvmrbf(Xtrain,Ytrain, Xtest,Ytest)
    [lambda, sigma] = cross_validate(Xtrain, Ytrain);
    alpha = softsvmrbf(lambda, sigma, Xtrain, Ytrain);
    
end