load(".\seabedFunctions\vettore_compensato_piano_inclinato.mat");
z_auv = 0;
z_base = 300;
dx = .1;
dy = .1;
label = "m";
res_x = abs(floor(max(vettore_risultante(1,:))/dx) - floor(min(vettore_risultante(1,:))/dx))+1;
res_y = abs(floor(max(vettore_risultante(2,:))/dy) - floor(min(vettore_risultante(2,:))/dy))+1;
offset_x = abs(floor(min(vettore_risultante(1,:))/dx));
offset_y = abs(floor(min(vettore_risultante(2,:))/dy));
M_seabed = zeros(res_x,res_y);
for i = 1:res_x
    for j = 1:res_y
        M_seabed(i, j) = 105 - 0.1 * j;
    end
end
plotSurface(-M_seabed, "Seabed", [-inf inf], dx, dy, "m", -offset_x, -offset_y)
[seabed_XY, seabed_values] = matrix2scatteredData(M_seabed, 1, 1);
X_data = arrayfun(@(x)floor(x/dx)+offset_x+1,vettore_risultante(1,:));
Y_data = arrayfun(@(y)floor(y/dy)+offset_y+1,vettore_risultante(2,:));
M = redundantScatteredData2matrix([(X_data') (Y_data')], vettore_risultante(3,:)', res_x, res_y);
[samples_XY, samples] = sparseMatrix2scatteredData(M, 1, 1);

%interpolation
N_iter = 3;
times = zeros(N_iter, 1);
for i=1:N_iter
    close;
%     linearInterpolation
%     plotSurface(M_linear,'Linear interpolation',[-inf inf],dx,dy,"m", -offset_x, -offset_y)
    RBFInterpolation
    plotSurface(M_RBF_grnn, 'RBF interpolation - newgrnn', [-inf inf], dx, dy,"m", -offset_x, -offset_y);
%     naturalNeighbourInterpolation
%     plotSurface(M_natural, 'Natural neighbour interpolation', [-inf inf], dx, dy, "m", -offset_x, -offset_y);
%     shepardInterpolation
%     plotSurface(M_shepard, 'Shepard interpolation',[-inf inf], dx, dy, "m", -offset_x, -offset_y);
%     minimumCurvatureInterpolation
%     plotSurface(M_mincurv,'Minimum curvature interpolation',[-inf inf], dx, dy,"m", -offset_x, -offset_y);
%     v4Interpolation
%     plotSurface(M_v4, 'v4 interpolation', [-inf inf], dx, dy, "m", -offset_x, -offset_y);
    times(i, 1) = time;
    fprintf("%d / %d\n",i, N_iter);
end
%confidence interval
ci(times);
fprintf("%.1f\n", error);

figure
plot(Y_data-1,X_data-1,'or')
xlabel("X ["+label+"]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', floor((t-offset_y)*dy))
ylabel("Y ["+label+"]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', floor((t-offset_x)*dx))