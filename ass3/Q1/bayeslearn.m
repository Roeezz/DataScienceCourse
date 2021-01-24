function [allpos, ppos, pneg] = bayeslearn(Xtrain, Ytrain)
[m, d] = size(Xtrain);
allpos = sum(Ytrain(Ytrain > 0)) / m;
allneg = 1 - allpos;
XtrainT = transpose(Xtrain);
ppos = zeros(d,1);
pneg = zeros(d,1);
for i = 1:d
    XtrainTi = XtrainT(i,:);
    if allpos ~= 0
        ppos(i) = (sum(XtrainTi(Ytrain > 0)) / m) / allpos;
    end
    if allneg ~=0
        pneg(i) = (sum(XtrainTi(Ytrain < 0)) / m) / allneg;
    end
end
end