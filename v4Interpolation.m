interpolated_points_v4 = griddata(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2), 'v4');
M_v4 = scatteredData2matrix(seabed_XY, interpolated_points_v4, res_x, res_y);
M_v4 = -(M_v4 + z_auv);
figure('Name','v4 interpolation','NumberTitle','off')
subplot(1,2,1);
s = pcolor(M_v4);
s.EdgeColor = 'none';
xlabel("X [cm]");
ylabel("Y [cm]");
c = colorbar;
c.Label.String = "Depth [m]";
subplot(1,2,2);
mesh(M_v4);
xlabel("X [cm]");
ylabel("Y [cm]");
zlabel("Depth [m]");
colorbar;
clear interpolated_points_v4 s