function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation
  [m,n] = size(FeatureMatrix)
  H = zeros(m);
  for i = 1 :m
    for j = 1 :n
  H(i) = H(i) + FeatureMatrix(i,j) * Theta(j + 1);
    endfor
  endfor
Sum =0;
for i = 1:m
Sum = Sum + (H(i) - Y(i)) * (H(i) - Y(i));
endfor
Error = Sum / (2*m);
endfunction