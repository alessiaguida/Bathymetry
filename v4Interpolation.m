tic;
interpolated_points_v4 = griddata(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2), 'v4');
time = toc;
M_v4 = scatteredData2matrix(seabed_XY, interpolated_points_v4, res_x, res_y);
M_v4 = -(M_v4 + z_auv);
plotSurface(M_v4, 'v4 interpolation')
clear interpolated_points_v4