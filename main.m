%--------------MAIN---------------
clear;
clc;
close all;

%------variables
%seabed's dimensions
x = 10; %m
y = 10; %m
%seabed sampling step
dx = 0.01; %m
%starting depth
z_base = 200; %m
%--echosounder
%source level
SL = 200; %dB
%detection threshold
DT = 80; %dB
%damping coefficient
alfa = 0; %dB
%target strength
TS = 0; %dB
%noise
N = 0; %dB
%signal frequency
f = 10000; %Hz
%signal duration
Td = 1; %sec
%sampling risolution
N_x = 10;
N_y = 50;
%auv mission depth
z_auv = 100; %m
%seabed dimension including padding
x_ext = x + 2;
y_ext = y + 2;

%--------code
% number of indexes between samples
Dx_index = floor(x / (N_x * dx));
Dy_index = floor(y / (N_y * dx));
%increasing resolution
N_x = N_x + 1;
N_y = N_y + 1;

%seabed initialization
seabed
%mission simulation
echosounder
%drawing mission path
path

%depths from signals
M_dep_samples = arrayfun(@(x) eco2R(x, SL, 0, 0), M_eco_pow);
M_dep_samples = eval(M_dep_samples);

%griddata and rbf interpolation
[samples_XY, samples] = matrix2scatteredData(M_dep_samples, Dx_index, Dy_index, res_x, res_y);
[seabed_XY, seabed_values] = matrix2scatteredData(M_seabed(1:res_x, 1:res_y), 1, 1, res_x, res_y);
linearInterpolation
err_linear = mse(M_linear, -M_seabed(1:res_x, 1:res_y));
%-------------
RBFInterpolation
err_rbf_rb = mse(M_RBF_rb,-M_seabed(1:res_x, 1:res_y));
err_rbf_grnn = mse(M_RBF_grnn, -M_seabed(1:res_x, 1:res_y));

%griddedInterpolant interpolation
[samples_X, samples_Y] = ndgrid(1:Dx_index:(N_x*Dx_index), 1:Dy_index:(N_y*Dy_index));
[seabed_X, seabed_Y] = ndgrid(1:1:res_x, 1:1:res_y);
splineInterpolation
err_spline = mse(M_spline, -M_seabed(1:res_x, 1:res_y));

%plots
figure;
subplot(2,2,1);
s = pcolor(-M_seabed); %M_seabed contains abs of depth values, negative by definition
s.EdgeColor = 'none';
colorbar;
title("Original seabed 2D");
subplot(2,2,2);
mesh(-M_seabed); %M_seabed contains abs of depth values, negative by definition
s.EdgeColor = 'none';
colorbar;
title("Original seabed 3D");
subplot(2,2,3);
s = pcolor(M_eco_pow);
s.EdgeColor = 'none';
colorbar;
title("Received signal");
subplot(2,2,4);
s = pcolor(M_path);
s.EdgeColor = 'none';
title("Mission path");
clear s;