function [pos_change, neg_change] = Question2d(X1train, X2train, X1test, X2test)

% create binary matrices based on the grayscale train images
X1train_bin = zeros(size(X1train));
X1train_bin(X1train > 128) = 1;
X2train_bin = zeros(size(X2train));
X2train_bin(X2train > 128) = 1;

[Xtrain, Ytrain] = gensmallm(X1train_bin, X2train_bin, 1, -1, 10000);

[allpos, ppos, pneg] = bayeslearn(Xtrain, Ytrain);

% create binary matrices based on the grayscale test images
X1test_bin = zeros(size(X1test));
X1test_bin(X1test > 128) = 1;
X2test_bin = zeros(size(X2test));
X2test_bin(X2test > 128) = 1;

Xtest = [X1test_bin; X2test_bin];
Ypredict_og = bayespredict(allpos, ppos, pneg, Xtest);
Ypredict_fake = bayespredict(0.75, ppos, pneg, Xtest);

[m, ~] = size(Xtest);
Ychanges = Ypredict_fake(Ypredict_og ~= Ypredict_fake);
pos_change = sum(Ychanges(Ychanges > 0)) / m;
neg_change = - sum(Ychanges(Ychanges < 0)) / m;
end