addpath("./mincurvToolbox");
interpolated_points_mincurv = mincurvi(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2));
M_mincurv = scatteredData2matrix(seabed_XY, interpolated_points_mincurv, res_x, res_y);
M_mincurv = -(M_mincurv + z_auv);
plotSurface(M_mincurv,'Minimum curvature interpolation')
clear interpolated_points_natural