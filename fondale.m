%-----------fondale.m------------
%genera matrice
res_x = x / dx;
res_y = y / dx;
%popolamento della matrice
M_fondale = zeros(res_x,res_y);

for i =1:res_x
    for j = 1:res_y
        M_fondale(i,j) = z_base + 10*sin(j/30);%+ 5*sin((i+j)/30) + 50*sin((i-2*j)/30)+20*rand; %+ funzione - heaviside(j - 40)
    end
end
clear i j;
% s =pcolor(-M_fondale); %profondità "negative"
% s.EdgeColor = 'none';