function [decoded_path] = decode_path(path, lines, cols)
    decoded_path = zeros(length(path)-1, 2);
    for i = 1:length(path)-1
        row = ceil(path(i) / cols);
        col = mod(path(i), cols);
        if col == 0
            col = cols;
        endif
        decoded_path(i, 1) = row;
        decoded_path(i, 2) = col;
    endfor
endfunction
