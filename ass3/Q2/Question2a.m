function errors = Question2a(X1train, X2train, X1test, X2test)
errors = zeros(10,1);
for m = 1000:1000:10000
    disp(m);
    errors(m/1000) = train_on_2_numbers(X1train, X2train, X1test, X2test, m);
    disp(errors(1:m/1000));
end
end