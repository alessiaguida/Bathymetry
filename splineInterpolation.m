F = griddedInterpolant(samples_X, samples_Y, M_dep_samples, 'spline');
M_spline = F(seabed_X, seabed_Y);
M_spline = -(M_spline + z_auv);
figure('Name','Spline interpolation','NumberTitle','off')
subplot(1,2,1);
s = pcolor(M_spline);
s.EdgeColor = 'none';
colorbar;
subplot(1,2,2);
mesh(M_spline);
colorbar;
clear s