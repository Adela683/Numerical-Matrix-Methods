function [Y, InitialMatrix] = parse_csv_file(file_path)

    fid = fopen(file_path, 'r');
    n = 1;
    header = fgetl(fid);
    for i = 1:length(header)
      c = substr(header, i, 1);
      if(c == ',')
        n++;
      endif
    endfor
    
    m = 0;
    while ~feof(fid)
      fgetl(fid);
      m++;
    end
    Y = zeros(m, 1);
    InitialMatrix = cell(m, n+1);
    frewind(fid);
    line = fgetl(fid);
    for i = 1:m
        line = fgetl(fid);
        values = strsplit(line, ',');
        Y(i) = str2double(values{1});
        for j = 2:n
            if ~isnan(str2double(values{j}))
                InitialMatrix{i, j} = str2double(values{j});
            else
                InitialMatrix{i, j} = values{j};
            endif
        endfor
    endfor
    fclose(fid);
endfunction
