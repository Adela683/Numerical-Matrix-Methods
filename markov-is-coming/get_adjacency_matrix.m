function [Adj] = get_adjacency_matrix(Labyrinth)
  [rows, columns] = size(Labyrinth); 
  numNodes = rows * columns;
  
  Adj = zeros(numNodes + 2, numNodes + 2);
  Adj(numNodes + 2, numNodes + 2) = 1;
  Adj(numNodes + 1, numNodes + 1) = 1;
  
  for i = 1:rows
    for j = 1:columns
      currentNode = (i - 1) * columns + j;
      
      if bitget(Labyrinth(i,j), 4) == 0 && i > 1
        Adj(currentNode, currentNode - columns) = 1;
      endif
      
      if bitget(Labyrinth(i,j), 3) == 0 && i < rows
        Adj(currentNode, currentNode + columns) = 1;
      endif
      
      if bitget(Labyrinth(i,j), 2) == 0 && j < columns
        Adj(currentNode, currentNode + 1) = 1;
      endif
      
      if bitget(Labyrinth(i,j), 1) == 0 && j > 1
        Adj(currentNode, currentNode - 1) = 1;
      endif
      
      if bitget(Labyrinth(i,j), 4) == 0 && i == 1
        Adj(currentNode, numNodes + 1) = 1;
      endif
      
      if bitget(Labyrinth(i,j), 3) == 0 && i == rows
        Adj(currentNode, numNodes + 1) = 1;
      endif
      
      if bitget(Labyrinth(i,j), 2) == 0 && j == columns
        Adj(currentNode, numNodes + 2) = 1;
      endif
      
      if bitget(Labyrinth(i,j), 1) == 0 && j == 1
        Adj(currentNode, numNodes + 2) = 1;
      endif
    endfor
  endfor
endfunction
