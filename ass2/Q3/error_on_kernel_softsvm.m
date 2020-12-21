function validation_error = validate_kernel_soft_svm(alpha,sub_gram_matrix,Yval)
   linear_comb_matrix = alpha.*sub_gram_matrix;
   Ypredictions = sign(sum(linear_comb_matrix,1));
   validation_error = mean(Yval ~= Ypredictions);
end