F_nearest = griddedInterpolant(samples_X, samples_Y, M_dep_samples, 'nearest');
M_nearest = F_nearest(seabed_X, seabed_Y);
M_nearest = -(M_nearest + z_auv);
figure('Name','Nearest neighbour interpolation','NumberTitle','off')
subplot(1,2,1);
s = pcolor(M_nearest);
s.EdgeColor = 'none';
xlabel("X [cm]");
ylabel("Y [cm]");
c = colorbar;
c.Label.String = "Depth [m]";
subplot(1,2,2);
mesh(M_nearest);
xlabel("X [cm]");
ylabel("Y [cm]");
zlabel("Depth [m]");
colorbar;
clear s