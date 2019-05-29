M_seabed = zeros(res_x_ext,res_y_ext);
for i =1:res_x_ext
    for j = 1:res_y_ext
        M_seabed(i,j) = z_base - heaviside(j - res_y_ext * 0.3); %step created at the 30% line of extended seabed
    end
end
clear i j