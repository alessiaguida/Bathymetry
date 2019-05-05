M_percorso = zeros(N_x*Dx_index,N_y*Dy_index);
i = 1;
while i <= N_x
    j = 1;
    while j <= N_y*Dy_index
        M_percorso((i -1) * Dx_index + 1, j)= -1;
        j = j + 1;
    end
    if mod(i, 2) == 1
        j = 1;
        while j <= N_y
            M_percorso((i - 1) * Dx_index + 1, (j - 1) * Dy_index + 1)= 1; %segnale
            j = j + 1;
        end
    else
        %indietro
        %fprintf("ciao");
        j = N_y;
        while j >= 1
            M_percorso((i-1) * Dx_index +1, (j-1) * Dy_index +1) = 1; %segnale
            j = j - 1;
        end
    end
    i = i + 1;
end
% figure;
% s=pcolor(M_percorso);
% s.EdgeColor = 'none';