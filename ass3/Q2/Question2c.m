function [ppos, pneg] = Question2c(X1train, X2train)
X1train_bin = zeros(size(X1train));
X1train_bin(X1train > 128) = 1;
X2train_bin = zeros(size(X2train));
X2train_bin(X2train > 128) = 1;

[Xtrain, Ytrain] = gensmallm(X1train_bin, X2train_bin, 1, -1, 10000);
[~, ppos, pneg] = bayeslearn(Xtrain, Ytrain);
ppos = reshape(ppos, [28, 28]);
pneg = reshape(pneg, [28, 28]);
end