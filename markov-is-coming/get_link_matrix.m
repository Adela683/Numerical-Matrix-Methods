function [Link] = get_link_matrix(Labyrinth)
  Adj = get_adjacency_matrix(Labyrinth);
  [rows, columns] = size(Adj);
  Link = sparse(rows, columns);
  
  for i = 1:rows
    rowSum = sum(Adj(i, :));
    
    if rowSum > 0
      Link(i, :) = Adj(i, :) / rowSum;
    endif 
  endfor
endfunction
