dx = evalin('base','dx');
dy = evalin('base','dy');
Dx_index = evalin('base','Dx_index');
Dy_index = evalin('base','Dy_index');
res_x = evalin('base','res_x');
res_y = evalin('base','res_y');
[samples_XY, samples] = matrix2scatteredData(M_dep_samples, Dx_index, Dy_index);
[seabed_XY, seabed_values] = matrix2scatteredData(M_seabed(1:res_x, 1:res_y), 1, 1);
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
fprintf("%.1f\n", error);