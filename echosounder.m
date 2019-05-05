%--------echosounder.m-------------
i = 1;
M_eco_pot = zeros(N_x, N_y);
%rng(4); %seed
while i <= N_x
    if mod(i, 2) == 1
        %avanti
        j = 1;
        while j <= N_y
            M_eco_pot(i, j) = eco(M_fondale((i -1) * Dx_index + 1, (j - 1) * Dy_index + 1) - z_auv, SL, DT, 0, 0, 0);
            j = j + 1;
        end
    else
        %indietro
        j = N_y;
        while j >= 1
            M_eco_pot(i, j) = eco(M_fondale((i-1) * Dx_index +1, (j-1) * Dy_index +1) - z_auv, SL, DT, 0, 0, 0); %-abs(normrnd(0, 0.15))
            j = j - 1;
        end
    end
    i = i + 1;
end
clear i j;
% figure;
% s=pcolor(M_eco_pot);
% s.EdgeColor = 'none';