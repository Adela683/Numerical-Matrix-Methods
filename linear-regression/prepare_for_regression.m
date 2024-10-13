function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples

  % TODO: prepare_for_regression implementation
  [m, n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n + 1);
  i1 = 1;
  j1 = 1;
  for i = 1:m
    j1 = 1;
    for j = 1:n
      mat = cell2mat(InitialMatrix(i, j))
      if(isnumeric(mat) == 1)
        FeatureMatrix(i1, j1) = mat;
        j1++;
      elseif(strcmp(mat,'yes'))
        FeatureMatrix(i1,j1) = 1;
        j1++;
      elseif(strcmp(mat,'no'))
        FeatureMatrix(i1,j1) = 0;
        j1++;
      elseif(strcmp(mat,'furnished'))
        FeatureMatrix(i1,j1) = 0;
        FeatureMatrix(i1,j1+1) = 0;
        j1+=2;
      elseif(strcmp(mat,'semi-furnished'))
        FeatureMatrix(i1,j1) = 1;
        FeatureMatrix(i1,j1+1) = 0;
        j1+=2;
      elseif(strcmp(mat,'unfurnished'))
        FeatureMatrix(i1,j1) = 0;
        FeatureMatrix(i1,j1+1) = 1;
        j1+=2;
      endif
    endfor
    i1++;
  endfor

endfunction