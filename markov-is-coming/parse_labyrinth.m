function [Labyrinth] = parse_labyrinth(file_path)
    % file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits

  % Labyrinth -> the matrix of all encodings for the labyrinths walls

  in=fopen(file_path, 'r');
  rows = fscanf(in, '%d', 1);
  cols = fscanf(in, '%d', 1);

  Labyrinth = zeros(rows, cols);
  for i = 1:rows
    for j = 1:cols
      Labyrinth(i,j) = fscanf(in, '%d', 1);
    endfor
  endfor

endfunction