%--------------MAIN---------------
clear;
clc;
close all;
%------variabili 
%--fondale
%dimensioni fondale
x = 10; %m
y = 10; %m
%spaziatura tra punti
dx = 0.01; %m
%profondità di base
z_base = 200; %m
%--echosounder
%potenza
SL = 200; %dB
%soglia
DT = 80; %dB
%attenuazione
alfa = 0; %dB
%target strength
TS = 0; %dB
%rumore
N = 0; %dB
%frequenza
f = 10000; %Hz
%durata impulso
Td = 1; %sec
%risoluzione
N_x = 10;
N_y = 50;
%profondità di missione
z_auv = 100; %m
%fondale esteso
x_ext = x + 2;
y_ext = y + 2;
%-------corpo
% variazione per numero di indici
Dx_index = floor(x / (N_x * dx));
Dy_index = floor(y / (N_y * dx));
%incremento risoluzione
N_x = N_x + 1;
N_y = N_y + 1;
fondale
echosounder
percorso
M_dep_samples = arrayfun(@(x) eco2R(x, SL, 0, 0), M_eco_pow);
M_dep_samples = eval(M_dep_samples);
%interpolatori con griddata ed rbf
[samples_XY, samples] = matrix2scatteredData(M_dep_samples, Dx_index, Dy_index, res_x, res_y);
[seabed_XY, seabed_values] = matrix2scatteredData(M_seabed(1:res_x, 1:res_y), 1, 1, res_x, res_y);
linearInterpolation
err_linear = immse(M_linear, M_seabed(1:res_x, 1:res_y));
RBFInterpolation
err_rbf_rb = immse(M_RBF_rb, M_seabed(1:res_x, 1:res_y));
err_rbf_grnn = immse(M_RBF_grnn, M_seabed(1:res_x, 1:res_y));
%interpolatori con griddedInterpolant
[samples_X, samples_Y] = ndgrid(1:Dx_index:(N_x*Dx_index), 1:Dy_index:(N_y*Dy_index));
[seabed_X, seabed_Y] = ndgrid(1:1:res_x, 1:1:res_y);
splineInterpolation
err_spline = immse(M_spline, M_seabed(1:res_x, 1:res_y));
figure;
subplot(2,2,1);
sfond = pcolor(-M_seabed); %profondità "negative"
sfond.EdgeColor = 'none';
subplot(2,2,2);
s = pcolor(M_eco_pow);
s.EdgeColor = 'none';
subplot(2,2,3);
s = pcolor(M_path);
s.EdgeColor = 'none';