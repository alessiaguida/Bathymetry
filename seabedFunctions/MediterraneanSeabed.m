if use_previous_data == 0
    M_seabed = - dlmread("GEBCO_2019_5.5_40.0_6.9_38.9_ESRIASCII.txt");
else
    M_seabed = evalin('base', 'M_seabed');
end
[x_ext, y_ext] = gcs2km(6.0,40.0,7.4,38.9);
[res_x_ext, res_y_ext] = size(M_seabed);
dx = x_ext/res_x_ext;
dy = y_ext/res_y_ext;
res_x = ceil(100 / dx);
res_y = ceil(100 / dy);
x = res_x * dx;
y = res_y * dy;
assignin('base','res_x_ext', res_x_ext);
assignin('base','res_y_ext', res_y_ext);
assignin('base','dx', dx);
assignin('base','dy', dy);
assignin('base','res_x', res_x);
assignin('base','res_y', res_y);
assignin('base','x', x);
assignin('base','y', y);
Dx_index = ceil(res_x / N_x);
Dy_index = ceil(res_y / N_y);
assignin('base','Dx_index', Dx_index);
assignin('base','Dy_index', Dy_index);
assignin('base','z_base', 0);
N_x = N_x + 1;
N_y = N_y + 1;