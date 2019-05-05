%------rb
net_rb = newrb(samples_XY', samples', 0); %columns are inputs
interpolated_points_RBF_rb = (sim(net_rb, seabed_XY'))';
M_RBF_rb = scatteredData2matrix(seabed_XY, interpolated_points_RBF_rb, res_x, res_y);
M_RBF_rb = -(M_RBF_rb + z_auv);
close NEWRB;
figure('Name','RBF interpolation - newrb','NumberTitle','off')
subplot(1,2,1);
s = pcolor(M_RBF_rb);
s.EdgeColor = 'none';
colorbar;
subplot(1,2,2);
mesh(M_RBF_rb);
colorbar;
%-------grnn
net_grnn = newgrnn(samples_XY', samples'); 
interpolated_points_RBF_grnn = (sim(net_grnn, seabed_XY'))';
M_RBF_grnn = scatteredData2matrix(seabed_XY, interpolated_points_RBF_grnn, res_x, res_y);
M_RBF_grnn = -(M_RBF_grnn + z_auv);
figure('Name','RBF interpolation - newgrnn','NumberTitle','off')
subplot(1,2,1);
s = pcolor(M_RBF_grnn);
s.EdgeColor = 'none';
colorbar;
subplot(1,2,2);
mesh(M_RBF_grnn);
colorbar;
clear interpolated_points_RBF_grnn interpolated_points_RBF_rb s