%matrix dimensions
res_x = x / dx;
res_y = y / dx;
res_x_ext = x_ext / dx;
res_y_ext = y_ext / dx;

%creating matrix
%{
rng(5);
F = 3;% frequency-filter width
[X,Y] = ndgrid(1:res_x_ext,1:res_y_ext);
i = min(X-1,res_x_ext-X+1);
j = min(Y-1,res_y_ext-Y+1);
H = exp(-0.5*(i.^2+j.^2)/F^2);
M_seabed = z_base + 1000 * real(ifft2(H.*fft2(randn([res_x_ext res_y_ext]))));
%}
M_seabed = zeros(res_x_ext,res_y_ext);
for i =1:res_x_ext
    for j = 1:res_y_ext
        M_seabed(i,j) = z_base + 0.3*sin(j/100)*sin(i/100);%+ 5*sin((i+j)/30) + 50*sin((i-2*j)/30)+20*rand; %+ funzione - heaviside(j - 40)
    end
end
%}
clear i j X Y H F;