function Ytestprediction = predictknn (classifier, Xtest),
    Xtrain = classifier.Xtrain;
    Ytrain = classifier.Ytrain;
    k = classifier.k;
    m = size(Xtrain)(1);
    n = size(Xtest)(1);
    
    Ytestprediction = zeros(n,1);
    dists = zeros(1,m);
    for i = 1:n,
        for j = 1:m,
            dists(1,j) = norm(Xtest(i,:) - Xtrain(j,:));
        endfor;
        
        [_, indices] = sort(dists);
        best_k = indices(1:k);
        labels = zeros(1,10);
        for r=1:k,
            label = Ytrain(best_k(r));
            labels(label + 1)++;
        endfor;
        [_, Ytestprediction(i)] = max(labels);
        Ytestprediction(i) -= 1;
    endfor;
endfunction
