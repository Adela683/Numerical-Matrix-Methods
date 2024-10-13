function [matrix] = initialize_weights(L_prev, L_next)
    % Calculează ϵ
    epsilon = sqrt(6) / sqrt(L_prev + L_next);

    % Inițializează matricea de ponderi cu valori aleatoare din intervalul (-ϵ, ϵ)
    matrix = 2 * epsilon * rand(L_next, L_prev + 1) - epsilon;
endfunction
