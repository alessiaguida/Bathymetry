close all;
rng(5);
limits = [-315 -285];
F = 3;% frequency-filter width
[X,Y] = ndgrid(1:res_x_ext,1:res_y_ext);
i = min(X-1,res_x_ext-X+1);
figure('Name','i','NumberTitle','off')
mesh(i);
j = min(Y-1,res_y_ext-Y+1);
figure('Name','j','NumberTitle','off')
mesh(j);
figure('Name','i.^2+j.^2','NumberTitle','off')
mesh(i.^2+j.^2);
H = exp(-0.5*(i.^2+j.^2)/F^2);
figure('Name','H','NumberTitle','off')
mesh(fftshift(H));
%H is a gaussian function applied to a bidimensional space
%H is used as a gaussian filter for a gaussian signal
figure('Name','randn','NumberTitle','off')
mesh(randn([res_x_ext res_y_ext]));
figure('Name','|fft2(randn)|','NumberTitle','off')
fourier = fft2(randn([res_x_ext res_y_ext]));
mesh(abs(fftshift(fft2(randn([res_x_ext res_y_ext])))));
figure('Name','|H.*fft2(randn)|','NumberTitle','off')
mesh(abs((H.*fft2(randn([res_x_ext res_y_ext])))));
plotSurface(ifft2(H.*fft2(randn([res_x_ext res_y_ext]))), 'seabed not scaled', [-inf inf],1,1,"m");
M_seabed = z_base + 1000 * real(ifft2(H.*fft2(randn([res_x_ext res_y_ext]))));
clear F i j X Y H