[samples_XY, samples] = matrix2scatteredData(M_eco_pot, Dx_index, Dy_index);
[seabed_XY, seabed_values] = matrix2scatteredData(M_fondale, 1, 1);
interpolated_points_linear = griddata(samples_XY(:,1), samples_XY(:,2), samples, seabed_XY(:,1), seabed_XY(:,2), 'linear');
M_linear = scatteredData2matrix(seabed_XY, interpolated_points_linear, res_x, res_y);
figure
s = pcolor(M_linear);
s.EdgeColor = 'none';
figure
mesh(M_linear);
figure
mesh(-M_fondale);
%err_linear = immse(, ref);
%fprintf("\n L'errore quadratico medio dell'interpolazione lineare è %0.4f\n", err_linear);