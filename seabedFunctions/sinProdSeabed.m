M_seabed = zeros(res_x_ext,res_y_ext);
for i =1:res_x_ext
    for j = 1:res_y_ext
        M_seabed(i,j) = z_base + 1.5*sin(j/100)*sin(i/100);
    end
end
clear i j