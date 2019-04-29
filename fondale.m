%fondale
%dimensioni fondale
x = 50;
y = 50;
%spaziatura tra punti
dx = 0.1;
%profondità di base
z_base = 100;
%genera matrice
n_x = x / dx;
n_y = y / dx;
M_fondale = zeros(n_x,n_y);
for i =1:n_x
    for j = 1:n_y
        M_fondale(i,j) = z_base;% + normrnd(0,1); %+ funzione
    end
end
s = pcolor(M_fondale);
s.EdgeColor = 'none';