function error_on_test_predictions = testsoftsvm(w,Xtest,Ytest)
    Ypredictions = zeros(size(Ytest));
    [k,~] = size(Xtest);
    for i = 1:k
        Ypredictions(i) = sign(Xtest(i,:) * w);
    end
    error_on_test_predictions = mean(Ytest ~= Ypredictions);
end