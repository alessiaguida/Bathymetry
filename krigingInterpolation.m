addpath("./krigingToolbox/fminsearchbnd");
addpath("./krigingToolbox");
v = variogram(samples_XY, samples);
[dum, dum, dum, vstruct] = variogramfit(v.distance,v.val,[],[],[],'model','stable');
[M_kriging, M_var] = kriging(vstruct,samples_X, samples_Y, M_dep_samples,seabed_X, seabed_Y);
M_kriging = -(M_kriging + z_auv);
figure('Name','Kriging interpolation','NumberTitle','off')
subplot(1,2,1);
s = pcolor(M_kriging);
s.EdgeColor = 'none';
xlabel("X [cm]");
ylabel("Y [cm]");
c = colorbar;
c.Label.String = "Depth [m]";
subplot(1,2,2);
mesh(M_kriging);
xlabel("X [cm]");
ylabel("Y [cm]");
zlabel("Depth [m]");
colorbar;
clear dum M_var s c vstruct v