i = 1;
M_eco_pow = zeros(N_x, N_y);
while i <= N_x
    if mod(i, 2) == 1
        %forward
        j = 1;
        while j <= N_y
            M_eco_pow(i, j) = eco(M_seabed((i -1) * Dx_index + 1, (j - 1) * Dy_index + 1) - z_auv, SL, DT, TS, alfa, N);
            j = j + 1;
        end
    else
        %back
        j = N_y;
        while j >= 1
            M_eco_pow(i, j) = eco(M_seabed((i-1) * Dx_index +1, (j-1) * Dy_index +1) - z_auv, SL, DT, TS, alfa, N); %-abs(normrnd(0, 0.15))
            j = j - 1;
        end
    end
    i = i + 1;
end
clear i j;