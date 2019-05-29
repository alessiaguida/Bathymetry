M_seabed = zeros(res_x_ext,res_y_ext);
for i =1:res_x_ext
    for j = 1:res_y_ext
        M_seabed(i,j) = z_base;
    end
end
clear i j