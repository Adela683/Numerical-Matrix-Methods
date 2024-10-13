function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
	
  % TODO: get_Jacobi_parameters
  [rows, columns] = size(Link);
    G = Link(1:rows - 2 , 1:columns - 2);
    c = Link(1:rows - 2, columns - 1);
endfunction

