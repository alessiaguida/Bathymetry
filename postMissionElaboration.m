M_dep_samples = zeros(N_x, N_y);
i = 1;
while i <= N_x
        j = 1;
        while j <= N_y
            if outliers_active
                %outlier rejection if active
            end
            M_dep_samples(i, j) = eval(eco2R(M_eco_pow(i, j), SL, 0, 0));
            j = j + 1;
            x_bar = x_bar + .25 / (N_x * N_y);
            waitbar(x_bar, wb);
        end
    i = i + 1;    
end
clear i j
assignin('base','M_dep_samples', M_dep_samples);