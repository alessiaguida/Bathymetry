F_spline = griddedInterpolant(samples_X, samples_Y, M_dep_samples, 'spline');
M_spline = F_spline(seabed_X, seabed_Y);
M_spline = -(M_spline + z_auv);
plotSurface(M_spline, 'Spline interpolation')