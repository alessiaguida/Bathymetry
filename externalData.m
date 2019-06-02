load(".\seabedFunctions\vettore_compensato_piano_inclinato.mat");
z_auv = 200;
z_base = 300;
dx = .1;
dy = .1;
res_x = abs(floor(max(vettore_risultante(1,:))/dx) - floor(min(vettore_risultante(1,:))/dx))+1;
res_y = abs(floor(max(vettore_risultante(2,:))/dy) - floor(min(vettore_risultante(2,:))/dy))+1;
offset_x = abs(floor(min(vettore_risultante(1,:))/dx));
offset_y = abs(floor(min(vettore_risultante(2,:))/dy));
M_seabed = zeros(res_x,res_y);
[seabed_XY, dum] = matrix2scatteredData(M_seabed, 1, 1);
clear dum;
X_data = arrayfun(@(x)floor(x/dx),vettore_risultante(1,:));
Y_data = arrayfun(@(y)floor(y/dy),vettore_risultante(2,:));
M = redundantScatteredData2matrix([(X_data'+offset_x+1) (Y_data'+offset_y+1)], vettore_risultante(3,:)', res_x, res_y);
[samples_XY, samples] = sparseMatrix2scatteredData(M, 1, 1);
linearInterpolation
plotSurface(M_linear,'Linear interpolation',[-inf inf],dx,dy,"m", -offset_x, -offset_y)
naturalNeighbourInterpolation
plotSurface(M_natural,'Natural neighbour interpolation',[-inf inf],dx,dy,"m", -offset_x, -offset_y)
