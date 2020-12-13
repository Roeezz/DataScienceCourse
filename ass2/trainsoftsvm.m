function w = trainsoftsvm(lambda, Xtrain, Ytrain, m, n),
    choices = randi(Xtrain.size(1), m, 1);
    Xsample = Xtrain(choices, :);
    Ysample = Ytrain(choices);
    
    w = softsvm(lambda.^n, Xsample, Ysample);
endfunction
