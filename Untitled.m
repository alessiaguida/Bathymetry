T = dlmread("C:\Users\irace\Desktop\"+"GEBCO_2019_6.0_40.0_7.0_39.0_ESRIASCII.txt");
[x y] = gcs2km(6.0,40.0,7.0,39.0);
dx = x/240;
dy = y/240;
%matrix is 240 x 240
for i = 2:101
    fprintf("%d : %f\n",i, ceil(216/(i-1))*(i-1));
end
%RESULT: number of samples only up to 49
plotSurface(T,"Seabed", [-3010 -2700], dx, dy, "km");