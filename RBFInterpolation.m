[samples_XY, samples] = matrix2scatteredData(M_eco_pot, Dx_index, Dy_index);
[seabed_XY, seabed_values] = matrix2scatteredData(M_fondale, 1, 1);
net_rb = newrb(samples_XY', samples', 0); %considera gli input per colonna newgrnn
interpolated_points_RBF_rb = (sim(net_rb, seabed_XY'))';
M_RBF_rb = scatteredData2matrix(seabed_XY, interpolated_points_RBF_rb, res_x, res_y);
figure
s = pcolor(M_RBF_rb);
s.EdgeColor = 'none';
figure
mesh(M_RBF_rb);
net_grnn = newgrnn(samples_XY', samples'); %considera gli input per colonna newgrnn
interpolated_points_RBF_grnn = (sim(net_grnn, seabed_XY'))';
M_RBF_grnn = scatteredData2matrix(seabed_XY, interpolated_points_RBF_grnn, res_x, res_y);
figure
s = pcolor(M_RBF_grnn);
s.EdgeColor = 'none';
figure
mesh(M_RBF_grnn);
figure
mesh(-M_fondale);