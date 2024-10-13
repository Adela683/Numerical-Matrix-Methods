function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  Theta(1) = [];
  [m, n] = size(FeatureMatrix);
  H = zeros(m, 1);
  for i = 1:m
    for j = 1:n
      H(i) = H(i) + FeatureMatrix(i,j) * Theta(j); 
    endfor
  endfor

  Sum1 = 0;
  Sum2 = 0;
  for i = 1:m
    Sum1 = Sum1 + (Y(i) - H(i)) * (Y(i) - H(i));
  endfor

  for i = 1:n
    Sum2 = Sum2 + abs(Theta(i));
  endfor

  Error = (Sum1 / m) + lambda * Sum2;
endfunction