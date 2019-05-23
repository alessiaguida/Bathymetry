clc
% for n = 2:100
% aux = floor(1000/(n-1))*floor((n-1)/2)+ceil(1000/(n-1))*ceil((n-1)/2);
% aux = ceil(1000/(n-1))*(n-1);
% aux2 = ceil(1000/(n-1))/(1000/(n-1));
% fprintf("%d : %d : %d : %f <= %f\n", n, ceil(1000/(n-1)), aux, aux2, n/(n-1));
% end
%ncid = netcdf.close("C:\Users\irace\Desktop\GEBCO_2019_SID.nc");
T = dlmread("C:\Users\irace\Desktop\GEBCO_2019_-31.0_-3.0_-29.0_-5.0.txt");