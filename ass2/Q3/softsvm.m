function w = softsvm(lambda, Xtrain, Ytrain)
    [m, d] = size(Xtrain);
    H = zeros(d+m, d+m);
    H(1:d, 1:d) = eye(d);
    H = 2*lambda*H;
    u = zeros(d+m,1);
    u(d+1:d+m) = 1/m;
    
    YX = Ytrain.*Xtrain;
    A = zeros(2*m, d+m);
    A(1:m, d+1:d+m) = eye(m);
    A(m+1:2*m, d+1:d+m) = eye(m);
    A(m+1:2*m, 1:d) = YX;
    A = (-1) * A;
    
    v = zeros(2*m,1);
    v(m+1:2*m) = 1;
    v = (-1)*v;

    z = quadprog(H, u, A, v);
    w = z(1:d);
end
