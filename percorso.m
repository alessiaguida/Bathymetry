M_percorso = zeros(res_x,res_y);
i = 1;
while i <= N_x
    j = 1;
    while j <= res_y
        M_percorso(i * Dx_index, j)= -1;
        j = j + 1;
    end
    if mod(i, 2) == 0
        j = 1;
        while j <= N_y
            M_percorso(i * Dx_index, j * Dy_index)= 1; %segnale
            j = j + 1;
        end
    else
        %indietro
        j = N_y;
        while j >= 1
            M_percorso(i * Dx_index, j * Dy_index)= 1; %segnale
            j = j - 1;
        end
    end
    i = i + 1;
end
figure;
s=pcolor(M_percorso);
s.EdgeColor = 'none';