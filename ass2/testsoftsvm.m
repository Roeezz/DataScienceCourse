function error_or_test_predictions = testsoftsvm(w,Xtest,Ytest),
    Ypredictions = zeros(n,1);
    k,d = Xtest.size();
    for i in 1:k,
        Yprediction(i) = sign(Xtest(i)*w);
    endfor
    error_on_test_predictions = mean(Ytest != Ypredictions);
endfunction

