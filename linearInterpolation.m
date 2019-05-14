tic;
interpolated_points_linear = griddata(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2), 'linear');
M_linear = scatteredData2matrix(seabed_XY, interpolated_points_linear, res_x, res_y);
M_linear = -(M_linear + z_auv);
time = toc;
error =  mse(M_linear, -M_seabed(1:res_x, 1:res_y));
assignin('base','time', time);
assignin('base','error', error);
assignin('base','M_linear', M_linear);
plotSurface(M_linear, 'Linear interpolation', limits)
clear interpolated_points_linear