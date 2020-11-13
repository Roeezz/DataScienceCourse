function classifier = learnknn(k, Xtrain, Ytrain),
    classifier = struct("k", k, "Xtrain", Xtrain, "Ytrain", Ytrain);
endfunction
