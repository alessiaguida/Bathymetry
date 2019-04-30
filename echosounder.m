%--------echosounder.m-------------
% variazione per numero di indici
Dx_index = floor(x / (N_x * dx));
Dy_index = floor(y / (N_y * dx));
i = 1;
M_eco_pot = zeros(N_x, N_y);
%rng(4); %seed
while i <= N_x
    if mod(i, 2) == 0
        %avanti
        j = 1;
        while j <= N_y
            M_eco_pot(i, j) = eco(M_fondale(i * Dx_index, j * Dy_index), SL, DT, 0, 0, 0);
            j = j + 1;
        end
    else
        %indietro
        j = N_y;
        while j >= 1
            M_eco_pot(i, j) = eco(M_fondale(i * Dx_index, j * Dy_index), SL, DT, 0, 0, 0); %-abs(normrnd(0, 0.15))
            j = j - 1;
        end
    end
    i = i + 1;
end
figure;
s=pcolor(M_eco_pot);
s.EdgeColor = 'none';