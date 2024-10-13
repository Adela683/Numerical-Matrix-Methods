function [Y, InitialMatrix] = parse_data_set_file(file_path)
    
    fid = fopen(file_path, 'r');

    % Citeste dimensiunile matricei din prima linie a fișierului
    dims = sscanf(fgetl(fid), '%d');
    m = dims(1); % Numărul de rânduri
    n = dims(2); % Numărul de coloane

    % Inițializează matricea inițială
    InitialMatrix = cell(m, n);

    % Parcurge fiecare linie din fișier
    for i = 1:m
        % Citeste linia curentă
        line = fgetl(fid);
        % Desparte valorile separate de spații
        values = strsplit(line, ' ');
        % Extrage valoarea etichetei (prima valoare din linie)
        Y(i) = str2double(values{1});
        % Parcurge fiecare coloană din linie
        for j = 1:n
            % Verifică dacă valoarea este un număr sau un șir de caractere
            if ~isnan(str2double(values{j+1}))
                % Dacă este număr, convertiți în valoare numerică
                InitialMatrix{i, j} = str2double(values{j+1});
            else
                InitialMatrix{i, j} = values{j+1};
            endif
        endfor
    endfor

    fclose(fid);
endfunction
 