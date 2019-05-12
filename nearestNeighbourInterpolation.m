tic;
F_nearest = griddedInterpolant(samples_X, samples_Y, M_dep_samples, 'nearest');
M_nearest = F_nearest(seabed_X, seabed_Y);
M_nearest = -(M_nearest + z_auv);
time = toc;
error =  mse(M_nearest, -M_seabed(1:res_x, 1:res_y));
assignin('base','time', time);
assignin('base','error', error);
assignin('base','M_nearest', M_nearest);
plotSurface(M_nearest, 'Nearest neighbour interpolation')