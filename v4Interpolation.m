tic;
interpolated_points_v4 = griddata(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2), 'v4');
M_v4 = scatteredData2matrix(seabed_XY, interpolated_points_v4, res_x, res_y);
M_v4 = -(M_v4 + z_auv);
time = toc;
error =  mse(M_v4, -M_seabed(1:res_x, 1:res_y));
assignin('base','time', time);
assignin('base','error', error);
assignin('base','M_v4', M_v4);
clear interpolated_points_v4