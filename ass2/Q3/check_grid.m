function label_table = check_grid(alpha, sigma, Xtrain, Xgrid, Ygrid)
    [h,w] = size(Xgrid);
    m = size(Xtrain,1);
    label_table = zeros(h,w);
    for i=1:h
        for j=1:w
            for k=1:m
                label_table(i,j) = label_table(i,j) + alpha(k)*rbfkernel(sigma,Xtrain(k,:), [Xgrid(i,j) Ygrid(i,j)]);
            end
            label_table(i,j) = sign(label_table(i,j));
        end
    end
end