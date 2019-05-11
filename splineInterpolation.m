tic;
F_spline = griddedInterpolant(samples_X, samples_Y, M_dep_samples, 'spline');
M_spline = F_spline(seabed_X, seabed_Y);
M_spline = -(M_spline + z_auv);
time = toc;
error =  mse(M_spline, -M_seabed(1:res_x, 1:res_y));
assignin('base','time', time);
assignin('base','error', error);
assignin('base','error', M_spline);
plotSurface(M_spline, 'Spline interpolation')