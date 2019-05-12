i = 1;
M_eco_pow = zeros(N_x, N_y);
outliers_count = 0;
sigma_noise = 0.005;
rng(1);
while i <= N_x
    if mod(i, 2) == 1
        %forward
        j = 1;
        while j <= N_y
            M_eco_pow(i, j) = eco(M_seabed((i -1) * Dx_index + 1, (j - 1) * Dy_index + 1) - z_auv, SL, DT, TS, alfa, N)+ normrnd(0, sigma_noise) * noise_active;
            %outliers
            if rand * outliers_active > 0.97
                M_eco_pow(i, j) = M_eco_pow(i, j) + sign(2*rand - 1);
                outliers_count = outliers_count +1;
            end
            j = j + 1;
            x_bar = x_bar + .25 / (N_x * N_y);
            waitbar(x_bar, wb);
        end
    else
        %back
        j = N_y;
        while j >= 1
            M_eco_pow(i, j) = eco(M_seabed((i-1) * Dx_index +1, (j-1) * Dy_index +1) - z_auv, SL, DT, TS, alfa, N)+ normrnd(0, sigma_noise) * noise_active; %-abs(normrnd(0, 0.15))
            %outliers
            if rand * outliers_active > 0.97
                M_eco_pow(i, j) = M_eco_pow(i, j) + sign(2*rand - 1);
                outliers_count = outliers_count + 1;
            end
            j = j - 1;
            x_bar = x_bar + .25 / (N_x * N_y);
            waitbar(x_bar, wb);
        end
    end
    i = i + 1;    
end
assignin('base','outliers_count', outliers_count);
clear i j;