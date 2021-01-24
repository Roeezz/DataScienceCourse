function err=train_on_2_numbers(X1train, X2train, X1test, X2test, sampleSize)
% create binary matrices based on the grayscale train images
X1train_bin = zeros(size(X1train));
X1train_bin(X1train > 128) = 1;
X2train_bin = zeros(size(X2train));
X2train_bin(X2train > 128) = 1;

[Xtrain, Ytrain] = gensmallm(X1train_bin, X2train_bin, 1, -1, sampleSize);

[allpos, ppos, pneg] = bayeslearn(Xtrain, Ytrain);

% create binary matrices based on the grayscale test images
X1test_bin = zeros(size(X1test));
X1test_bin(X1test > 128) = 1;
X2test_bin = zeros(size(X2test));
X2test_bin(X2test > 128) = 1;

Xtest = [X1test_bin; X2test_bin];
Ytest = [ones(size(X1test,1),1); -ones(size(X2test,1),1)];
Ypredict = bayespredict(allpos, ppos, pneg, Xtest);
err = mean(Ytest ~= Ypredict);
end