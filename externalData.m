%loading data from file
load(".\seabedFunctions\vettore_compensato_piano_inclinato.mat");
%scaling mission data
z_auv = 0;
z_base = 300;
vettore_risultante(3, :) = z_base + vettore_risultante(3, :);
%granularity and useful structures
dx = .1;
dy = .1;
label = "m";
limits = [-inf inf];
%computing inspected area dimensions
res_x = abs(floor(max(vettore_risultante(1,:))/dx) - floor(min(vettore_risultante(1,:))/dx))+1;
res_y = abs(floor(max(vettore_risultante(2,:))/dy) - floor(min(vettore_risultante(2,:))/dy))+1;
%computing offset between the measures origin  
offset_x = abs(floor(min(vettore_risultante(1,:))/dx));
offset_y = abs(floor(min(vettore_risultante(2,:))/dy));
%recreating original seabed for comparison
M_seabed = zeros(res_x,res_y);
for i = 1:res_x
    for j = 1:res_y
        M_seabed(i, j) = 105 - 0.1 * j;
    end
end
M_seabed = z_base + M_seabed;
plotSurface(-M_seabed, "Seabed", [-inf inf], dx, dy, "m", -offset_x, -offset_y)
%computing interface structures for algorithms
[seabed_XY, seabed_values] = matrix2scatteredData(M_seabed, 1, 1);
%fixing granularity 
X_data = arrayfun(@(x)floor(x/dx)+offset_x+1,vettore_risultante(1,:));
Y_data = arrayfun(@(y)floor(y/dy)+offset_y+1,vettore_risultante(2,:));
%measures matrix with NaN where data are missing
M = redundantScatteredData2matrix([(X_data') (Y_data')], vettore_risultante(3,:)', res_x, res_y);
%scattered data structures not including NaN values
[samples_XY, samples] = sparseMatrix2scatteredData(M, 1, 1);

%interpolation, computing confidence interval
N_iter = 2;
times = zeros(N_iter, 1);
figure;
for i=1:N_iter
    close;
%     linearInterpolation
%     plotSurface(M_linear,'Linear interpolation', limits, dx, dy, label, -offset_x, -offset_y);
    naturalNeighbourInterpolation
    plotSurface(M_natural, 'Natural neighbour interpolation', limits, dx, dy, label, -offset_x, -offset_y);
%     shepardInterpolation
%     plotSurface(M_shepard, 'Shepard interpolation', limits, dx, dy, label, -offset_x, -offset_y);
%     minimumCurvatureInterpolation
%     plotSurface(M_mincurv,'Minimum curvature interpolation', limits, dx, dy, label, -offset_x, -offset_y);
%     v4Interpolation
%     plotSurface(M_v4, 'v4 interpolation', limits, dx, dy, label, -offset_x, -offset_y);
    times(i, 1) = time;
    fprintf("%d / %d\n",i, N_iter);
end
ci(times);
fprintf("%.1f\n", error);
%plotting measures position
figure
plot(Y_data-1,X_data-1,'or')
xlabel("X ["+label+"]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', floor((t-offset_y)*dy))
ylabel("Y ["+label+"]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', floor((t-offset_x)*dx))