function w = softsvm(lambda, Xtrain, Ytrain),
    m, d = Xtrain.size();
    
    H = zeros(d+m, d+m);
    H(1:d, 1:d) = eye(d);
    H = 2*lambda*H;
    u = zeros(d+m,1);
    u(d+1:d+m) = 1/m;
    
    A = zeros(2*m, d+m);
    A(1:m, d+1:d+m) = eye(m);
    A(m+1:2*m, d+1:d+m) = eye(m);
    YX = zeros(m,d);
    for i = 1:m,
        YX(i,:) = Ytrain(i) * Xtrain(i);
    endfor
    A(m+1:2*m, 1:d) = YX;
    
    v = zeros(2*m,1);
    v(m+1:2*m) = 1;
    
    z = quadprog(H, u, A, v);
    w = z(1:d);
endfunction
