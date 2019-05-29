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
clear interpolated_points_RBF_grnn interpolated_points_RBF_rb net_rgnn