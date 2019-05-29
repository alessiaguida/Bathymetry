tic;
interpolated_points_natural = griddata(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2), 'linear');
M_natural = scatteredData2matrix(seabed_XY, interpolated_points_natural, res_x, res_y);
M_natural = -(M_natural + z_auv);
time = toc;
error =  mse(M_natural, -M_seabed(1:res_x, 1:res_y));
assignin('base','time', time);
assignin('base','error', error);
assignin('base','M_natural', M_natural);
clear interpolated_points_natural