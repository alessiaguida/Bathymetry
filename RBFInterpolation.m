%{
------rb
net_rb = newrb(samples_XY', samples', 0); %columns are inputs
interpolated_points_RBF_rb = (sim(net_rb, seabed_XY'))';
M_RBF_rb = scatteredData2matrix(seabed_XY, interpolated_points_RBF_rb, res_x, res_y);
M_RBF_rb = -(M_RBF_rb + z_auv);
close NEWRB;
plotSurface(M_RBF_rb,'RBF interpolation - newrb')
%}
%-------grnn
tic;
net_grnn = newgrnn(samples_XY', samples', 3.0); 
interpolated_points_RBF_grnn = (sim(net_grnn, seabed_XY'))';
M_RBF_grnn = scatteredData2matrix(seabed_XY, interpolated_points_RBF_grnn, res_x, res_y);
M_RBF_grnn = -(M_RBF_grnn + z_auv);
time = toc;
error =  mse(M_RBF_grnn, -M_seabed(1:res_x, 1:res_y));
assignin('base','time', time);
assignin('base','error', error);
assignin('base','M_RBF_grnn', M_RBF_grnn);
plotSurface(M_RBF_grnn, 'RBF interpolation - newgrnn')
clear interpolated_points_RBF_grnn interpolated_points_RBF_rb