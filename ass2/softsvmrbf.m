function alpha = softsvmrbf(lambda, sigma, Xtrain, Ytrain)
    [m,_] = size(Xtrain);
    gram_matrix = zeros(m,m);
    for i = 1:m,
        for j = 1:m,
            gram_matrix(i,j) = rbfkernel(sigma,Xtrain(i,:),Xtrain(j,:));
        endfor
    endfor
    H = zeros(2*m,2*m);
    H(1:m,1:m)=gram_matrix;
    H = 2*lambda*H;
    u = zeros(2*m,1);
    u(m+1:2*m) = 1/m;
    YG = zeros(m,m);
    YG = Ytrain.*gram_matrix;
    A = zeros(2*m, 2*m);
    A(1:m, m+1:2*m) = eye(m);
    A(m+1:2*m, m+1:2*m) = eye(m);
    A(m+1:2*m, 1:m) = YG;
    A = (-1) * A;
    v = zeros(2*m,1);
    v(m+1:2*m) = 1;
    v = (-1)*v;
end
