interpolated_points_linear = griddata(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2), 'linear');
M_linear = scatteredData2matrix(seabed_XY, interpolated_points_linear, res_x, res_y);
M_linear = -(M_linear + z_auv);
figure
s = pcolor(M_linear);
s.EdgeColor = 'none';
figure
mesh(M_linear);
clear interpolated_points_linear
%err_linear = immse(, ref);
%fprintf("\n L'errore quadratico medio dell'interpolazione lineare è %0.4f\n", err_linear);