rng(5);
F = 3;% frequency-filter width
[X,Y] = ndgrid(1:res_x_ext,1:res_y_ext);
i = min(X-1,res_x_ext-X+1);
j = min(Y-1,res_y_ext-Y+1);
H = exp(-0.5*(i.^2+j.^2)/F^2);
M_seabed = z_base + 1000 * real(ifft2(H.*fft2(randn([res_x_ext res_y_ext]))));
clear F i j X Y H