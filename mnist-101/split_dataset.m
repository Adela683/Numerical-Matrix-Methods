function [x_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
% Amestecarea exemplelor
shuffled_indices = randperm(size(X, 1));
X_shuffled = X(shuffled_indices, :);
y_shuffled = y(shuffled_indices);

% Numărul de exemple pentru setul de training
num_train_examples = round(size(X, 1) * percent);

% Setul de training
x_train = X_shuffled(1:num_train_examples, :);
y_train = y_shuffled(1:num_train_examples);

% Setul de test
X_test = X_shuffled(num_train_examples+1:end, :);
y_test = y_shuffled(num_train_examples+1:end);
endfunction
