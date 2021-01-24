function Ypredict = bayespredict(allpos, ppos, pneg, Xtest)
[m,~] = size(Xtest);
Ypredict = zeros(m,1);
for i = 1 : m
    x = Xtest(i,:);
    predict_pos = log(allpos) + sum(log(ppos(x == 1))) + sum(log(1 - ppos(x == 0)));
    predict_neg = log(1 - allpos) + sum(log(1 - pneg(x == 0))) + sum(log(pneg(x == 1)));
    if predict_pos > predict_neg
        Ypredict(i) =  1;
    elseif predict_pos < predict_neg
        Ypredict(i) = -1;
    else
        Ypredict(i) = 0;
    end
end
end
