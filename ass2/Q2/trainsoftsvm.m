function w = trainsoftsvm(lambda, Xtrain, Ytrain,m),
    choices = randi(size(Xtrain)(1), 1,m);
    Xsample = Xtrain(choices, :);
    Ysample = Ytrain(choices);
    w = softsvm(lambda, Xsample, Ysample);
endfunction
