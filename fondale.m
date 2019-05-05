%-----------fondale.m------------
%genera matrice
res_x = x / dx;
res_y = y / dx;
res_x_ext = x_ext / dx;
res_y_ext = y_ext / dx;
%popolamento della matrice
M_seabed = zeros(res_x_ext,res_y_ext);

for i =1:res_x_ext
    for j = 1:res_y_ext
        M_seabed(i,j) = z_base + 0.3*sin(j/100)*sin(i/100);%+ 5*sin((i+j)/30) + 50*sin((i-2*j)/30)+20*rand; %+ funzione - heaviside(j - 40)
    end
end
clear i j;
% s =pcolor(-M_fondale); %profondità "negative"
% s.EdgeColor = 'none';