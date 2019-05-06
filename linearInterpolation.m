interpolated_points_linear = griddata(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2), 'linear');
M_linear = scatteredData2matrix(seabed_XY, interpolated_points_linear, res_x, res_y);
M_linear = -(M_linear + z_auv);
figure('Name','Linear interpolation','NumberTitle','off')
subplot(1,2,1);
s = pcolor(M_linear);
s.EdgeColor = 'none';
xlabel("X [cm]");
ylabel("Y [cm]");
c = colorbar;
c.Label.String = "Depth [m]";
subplot(1,2,2);
mesh(M_linear);
xlabel("X [cm]");
ylabel("Y [cm]");
zlabel("Depth [m]");
colorbar;
clear interpolated_points_linear s