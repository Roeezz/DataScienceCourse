function gram_matrix = calc_gaussian_gram_matrix(sigma,Xtrain)
    [m,~] = size(Xtrain);
    gram_matrix = zeros(m,m);
    for i = 1:m
        for j = 1:m
            gram_matrix(i,j) = rbfkernel(sigma,Xtrain(i,:),Xtrain(j,:));
        end
    end
end
