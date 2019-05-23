dx = 0.1;
Dx_index = ceil(x / (N_x * dx));
Dy_index = ceil(y / (N_y * dx));
res_x = x / dx;
res_y = y / dx;
[samples_XY, samples] = matrix2scatteredData(M_dep_samples, Dx_index, Dy_index, res_x, res_y);
[seabed_XY, seabed_values] = matrix2scatteredData(M_seabed(1:res_x, 1:res_y), 1, 1, res_x, res_y);
[samples_X, samples_Y] = ndgrid(1:Dx_index:((N_x+1)*Dx_index), 1:Dy_index:((N_y+1)*Dy_index));
[seabed_X, seabed_Y] = ndgrid(1:1:res_x, 1:1:res_y);
%limits = [-303 -297]; %step, plane and sin
limits = [-315 -285]; %gaussian

N_iter = 5;
times = zeros(N_iter, 1);
for i=1:N_iter
    %interpolation method
    linearInterpolation
    times(i, 1) = time;
    fprintf("%d / %d\n",i, N_iter);
end
close all;
ci(times);
error