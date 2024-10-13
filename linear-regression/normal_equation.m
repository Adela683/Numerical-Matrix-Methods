function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
% Compute the coefficients Theta using the normal equation method
% Inputs:
%   - FeaturesMatrix: the feature matrix (m x n)
%   - Y: the response vector (m x 1)
%   - tol: the tolerance level (optional, default is 1e-10)
%   - iter: the maximum number of iterations (optional, default is 100)
% Output:
%   - Theta: the coefficients vector (n x 1)

% Check if tol and iter are provided, otherwise use default values
if nargin < 3
    tol = 1e-10;
endif
if nargin < 4
    iter = 100;
endif

FeaturesMatrix = [ones(size(FeaturesMatrix, 1), 1) FeaturesMatrix];
A = FeaturesMatrix' * FeaturesMatrix;
b = FeaturesMatrix' * Y;
[~, p] = chol(A);
if p == 0 
    Theta = A \ b;
else
    Theta = zeros(size(FeaturesMatrix, 2), 1);
endif

endfunction