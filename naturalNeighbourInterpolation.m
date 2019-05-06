interpolated_points_natural = griddata(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2), 'linear');
M_natural = scatteredData2matrix(seabed_XY, interpolated_points_natural, res_x, res_y);
M_natural = -(M_natural + z_auv);
figure('Name','Natural neighbour interpolation','NumberTitle','off')
subplot(1,2,1);
s = pcolor(M_natural);
s.EdgeColor = 'none';
xlabel("X [cm]");
ylabel("Y [cm]");
c = colorbar;
c.Label.String = "Depth [m]";
subplot(1,2,2);
mesh(M_natural);
xlabel("X [cm]");
ylabel("Y [cm]");
zlabel("Depth [m]");
colorbar;
clear interpolated_points_natural s c