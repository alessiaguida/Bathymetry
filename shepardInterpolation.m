power = 4; %valore compreso tra 3 e 10
interpolated_points_shepard= shepard_interp_2d(length(samples), samples_XY(:,1),samples_XY(:,2), samples, power, length(seabed_values), seabed_XY(:,1), seabed_XY(:,2));
M_shepard = scatteredData2matrix(seabed_XY, interpolated_points_shepard, res_x, res_y);
M_shepard = -(M_shepard + z_auv);
figure('Name','Shepard interpolation','NumberTitle','off')
subplot(1,2,1);
s = pcolor(M_shepard);
s.EdgeColor = 'none';
xlabel("X [cm]");
ylabel("Y [cm]");
c = colorbar;
c.Label.String = "Depth [m]";
subplot(1,2,2);
mesh(M_shepard);
xlabel("X [cm]");
ylabel("Y [cm]");
zlabel("Depth [m]");
colorbar;
clear interpolated_points_shepard s power