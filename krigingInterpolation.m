addpath("./krigingToolbox/fminsearchbnd");
addpath("./krigingToolbox");
v = variogram(samples_XY, samples);
[dum, dum, dum, vstruct] = variogramfit(v.distance,v.val,[],[],[],'model','stable');
[M_kriging, M_var] = kriging(vstruct,samples_X, samples_Y, M_dep_samples,seabed_X, seabed_Y);
M_kriging = -(M_kriging + z_auv);
plotSurface(M_kringing, "Kriging interpolation");
clear dum M_var vstruct v