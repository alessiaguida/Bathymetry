%[samples_XY, samples] = matrix2scatteredData(M_eco_pot, Dx_index, Dy_index, res_x, res_y);
%[seabed_XY, seabed_values] = matrix2scatteredData(M_fondale, 1, 1, res_x, res_y);
[samples_X, samples_Y] = ndgrid(1:Dx_index:(N_x*Dx_index), 1:Dy_index:(N_y*Dy_index));
F = griddedInterpolant(samples_X, samples_Y, M_eco_pot, 'spline');
[seabed_X, seabed_Y] = ndgrid(1:1:res_x, 1:1:res_y);
M_interpolated_points_spline = F(seabed_X, seabed_Y);
figure
mesh(M_interpolated_points_spline);
figure
s = pcolor(M_interpolated_points_spline);
s.EdgeColor = 'none';
