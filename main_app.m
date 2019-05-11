%------variables
%seabed's dimensions
x = evalin('base','x'); %m
y = evalin('base','y'); %m
%seabed sampling step
dx = 0.01; %m
%starting depth
z_base = evalin('base','z_base'); %m
%--echosounder
%source level
SL = evalin('base','SL'); %dB
%detection threshold
DT = evalin('base','DT'); %dB
%damping coefficient
alfa = evalin('base','alfa')/1000; %dB/m
%target strength
TS = 0; %dB
%noise
N = evalin('base','N'); %dB
%signal frequency
f = evalin('base','f'); %Hz
%signal duration
Td = evalin('base','Td'); %sec
%sampling resolution
N_x = evalin('base','N_x');
N_y = evalin('base','N_y');
%auv mission depth
z_auv = evalin('base','z_auv'); %m

%seabed dimension including padding
x_ext = x + 2;
y_ext = y + 2;

noise_active = evalin('base', 'noise_active');

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
auvPath

assignin('base','M_seabed', M_seabed);
%depths from signals
M_dep_samples = arrayfun(@(x) eco2R(x, SL, 0, 0), M_eco_pow);
M_dep_samples = eval(M_dep_samples);
assignin('base','M_dep_samples', M_dep_samples);

%data format for algoritm
[samples_XY, samples] = matrix2scatteredData(M_dep_samples, Dx_index, Dy_index, res_x, res_y);
[seabed_XY, seabed_values] = matrix2scatteredData(M_seabed(1:res_x, 1:res_y), 1, 1, res_x, res_y);
[samples_X, samples_Y] = ndgrid(1:Dx_index:(N_x*Dx_index), 1:Dy_index:(N_y*Dy_index));
[seabed_X, seabed_Y] = ndgrid(1:1:res_x, 1:1:res_y);


plotSurface(-M_seabed(1:res_x, 1:res_y), "Seabed");

%naturalNeighbourInterpolation

splineInterpolation

msgbox(sprintf("Execution time (s): %d \nMSE(m): %d", time, error), "result", "help");