addpath("./mincurvToolbox");
tic;
interpolated_points_mincurv = mincurvi(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2));
M_mincurv = scatteredData2matrix(seabed_XY, interpolated_points_mincurv, res_x, res_y);
M_mincurv = -(M_mincurv + z_auv);
time = toc;
error =  mse(M_mincurv, -M_seabed(1:res_x, 1:res_y));
assignin('base','time', time);
assignin('base','error', error);
assignin('base','M_mincurv', M_mincurv);
plotSurface(M_mincurv,'Minimum curvature interpolation')
clear interpolated_points_natural