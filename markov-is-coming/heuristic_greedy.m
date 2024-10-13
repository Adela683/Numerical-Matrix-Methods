function path = heuristic_greedy(start_position, probabilities, adjacency_matrix)
    path = [start_position];
    visited = false(1, length(probabilities));
    visited(start_position) = true;
    while ~isempty(path)
        position = path(end);
        if position == length(probabilities) - 1
            return;
        endif
        if all(visited(adjacency_matrix(position, :) ~= 0))
            path = path(1:end-1);
        else
            unvisited = find(~visited & adjacency_matrix(position, :) ~= 0);
            [max_prob, max_idx] = max(probabilities(unvisited));
            neigh = unvisited(max_idx);
            visited(neigh) = true;
            path = [path, neigh];
        endif
    endwhile
endfunction
