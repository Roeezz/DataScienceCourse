function error_on_test_predictions = testsoftsvm(w,Xtest,Ytest),
    Ypredictions = zeros(size(Ytest));
    [k,_] = size(Xtest);
    for i = 1:k,
        Ypredictions(i) = sign(Xtest(i,:) * w);
    endfor
    error_on_test_predictions = mean(Ytest != Ypredictions);
endfunction

