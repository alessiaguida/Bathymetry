%fondale
%dimensioni fondale
x = 50;
y = 50;
%spaziatura tra punti
dx = 0.1;
%profondità di base
z_base = 100;
%genera matrice
res_x = x / dx;
res_y = y / dx;
M_fondale = zeros(res_x,res_y);
for i =1:res_x
    for j = 1:res_y
        M_fondale(i,j) = z_base + 10*sin(j/10); %+ funzione - heaviside(j - 40)
    end
end
s = pcolor(-M_fondale); %profondità "negative"
s.EdgeColor = 'none';