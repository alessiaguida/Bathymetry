addpath("./mincurvToolbox");
interpolated_points_mincurv = mincurvi(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2));
M_mincurv = scatteredData2matrix(seabed_XY, interpolated_points_mincurv, res_x, res_y);
M_mincurv = -(M_mincurv + z_auv);
figure('Name','Minimum curvature interpolation','NumberTitle','off')
subplot(1,2,1);
s = pcolor(M_mincurv);
s.EdgeColor = 'none';
xlabel("X [cm]");
ylabel("Y [cm]");
c = colorbar;
c.Label.String = "Depth [m]";
subplot(1,2,2);
mesh(M_mincurv);
xlabel("X [cm]");
ylabel("Y [cm]");
zlabel("Depth [m]");
colorbar;
clear interpolated_points_natural s