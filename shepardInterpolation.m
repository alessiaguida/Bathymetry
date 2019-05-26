addpath("./shepardToolbox");
power = 4; %valore compreso tra 3 e 10
tic;
interpolated_points_shepard= shepard_interp_2d(length(samples), samples_XY(:,1),samples_XY(:,2), samples, power, length(seabed_values), seabed_XY(:,1), seabed_XY(:,2));
M_shepard = scatteredData2matrix(seabed_XY, interpolated_points_shepard, res_x, res_y);
M_shepard = -(M_shepard + z_auv);
time = toc;
error =  mse(M_shepard, -M_seabed(1:res_x, 1:res_y));
assignin('base','time', time);
assignin('base','error', error);
assignin('base','M_shepard', M_shepard);
clear interpolated_points_shepard power