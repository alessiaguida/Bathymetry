M_seabed = zeros(res_x_ext,res_y_ext);
for i =1:res_x_ext
    for j = 1:res_y_ext
        M_seabed(i,j) = z_base;%+ 5*sin((i+j)/30) + 50*sin((i-2*j)/30)+20*rand; %+ funzione - heaviside(j - 40)
%         x_bar = x_bar + .25 / (res_x_ext * res_y_ext);
%         waitbar(x_bar, wb);
    end
end
clear i j