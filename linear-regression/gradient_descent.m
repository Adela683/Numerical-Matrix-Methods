function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation
  function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
  % FeaturesMatrix -> the matrix of features
  % Y -> the vector of expected values
  % tol -> the tolerance for the error
  % iter -> the maximum number of iterations
  
  % TODO: normal_equation implementation
  
  % check if the matrix is positive definite
  R = chol(FeaturesMatrix' * FeaturesMatrix);
  if isempty(R)
      Theta = zeros(size(FeaturesMatrix, 2), 1);
      return;
  end
  
  % apply the conjugate gradient method
  Theta = zeros(size(FeaturesMatrix, 2), 1);
  p = r = Y - FeaturesMatrix * Theta;
  for k = 1:iter
      alpha = (r' * r) / (p' * FeaturesMatrix * p);
      Theta = Theta + alpha * p;
      r_next = r - alpha * FeaturesMatrix * p;
      if (norm(r_next) < tol)
          break;
      end
      beta = (r_next' * r_next) / (r' * r);
      p = r_next + beta * p;
      r = r_next;
  end
end

endfunction