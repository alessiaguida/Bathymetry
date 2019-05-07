F_nearest = griddedInterpolant(samples_X, samples_Y, M_dep_samples, 'nearest');
M_nearest = F_nearest(seabed_X, seabed_Y);
M_nearest = -(M_nearest + z_auv);
plotSurface(M_nearest, 'Nearest neighbour interpolation')