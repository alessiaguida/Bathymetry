addpath("./krigingToolbox/fminsearchbnd");
addpath("./krigingToolbox");
tic;
v = variogram(samples_XY, samples);
[dum, dum, dum, vstruct] = variogramfit(v.distance,v.val,[],[],[],'model','stable');
[M_kriging, M_var] = kriging(vstruct,samples_X, samples_Y, M_dep_samples,seabed_X, seabed_Y);
M_kriging = -(M_kriging + z_auv);
time = toc;
error =  mse(M_kriging, -M_seabed(1:res_x, 1:res_y));
assignin('base','time', time);
assignin('base','error', error);
assignin('base','error', M_kriging);
plotSurface(M_kringing, "Kriging interpolation");
clear dum M_var vstruct v