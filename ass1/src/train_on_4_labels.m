function errors = train_on_4_labels (k,trainA,trainB,trainC,trainD,testA,testB,testC,testD,labels,sample_sizes),
    errors = zeros(size(sample_sizes,2),10);
    i = 1;
    for m=sample_sizes,
        disp("Sample size: ");
        disp(m);
        Xtest = double([testA; testB; testC; testD]);
        A = labels(1);
        B = labels(2);
        C = labels(3);
        D = labels(4);
        Ytest = [A * ones(size(testA, 1), 1);
                 B * ones(size(testB, 1), 1);
                 C * ones(size(testC, 1), 1);
                 D * ones(size(testD, 1), 1)];
        for j=1:10,
            disp("  Iteration: ");
            disp(j);
            [Xtrain, Ytrain] = gensmallm(trainA,trainB,trainC,trainD,A,B,C,D,m);
            class = learnknn(k,Xtrain,Ytrain);
            YtestPred = predictknn(class, Xtest);
            errors(i,j) = mean(YtestPred != Ytest);
        endfor
        i += 1;
    endfor
endfunction