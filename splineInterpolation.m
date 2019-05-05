F = griddedInterpolant(samples_X, samples_Y, M_dep_samples, 'spline');
M_spline = F(seabed_X, seabed_Y);
M_spline = -(M_spline + z_auv);
figure
mesh(M_spline);
figure
s = pcolor(M_spline);
s.EdgeColor = 'none';

