clc;
x_bar = 0;
wb = waitbar(x_bar, "Seabed generation", "Name", "Progress");
%------variables
%seabed's dimensions
x = evalin('base','x'); %m
y = evalin('base','y'); %m
%seabed sampling step
dx = 0.01; %m
assignin('base','dx', dx);
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
TS = evalin('base','seabedType'); %dB
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

assignin('base','x_ext', x_ext);
assignin('base','y_ext', y_ext);
%control
noise_active = evalin('base', 'noise_active');
outliers_active = evalin('base', 'outliers_active');
interpolation = evalin('base', 'interpolation');
shape = evalin('base', 'shape');
use_previous_data = evalin('base', 'use_previous_data');

% number of indexes between samples
Dx_index = ceil(x / (N_x * dx));
Dy_index = ceil(y / (N_y * dx));
assignin('base','Dx_index', Dx_index);
assignin('base','Dy_index', Dy_index);
%increasing resolution
N_x = N_x + 1;
N_y = N_y + 1;

%matrix dimensions
res_x = x / dx;
res_y = y / dx;
assignin('base','res_x', res_x);
assignin('base','res_y', res_y);
res_x_ext = x_ext / dx;
res_y_ext = y_ext / dx;
assignin('base','res_x_ext', res_x_ext);
assignin('base','res_y_ext', res_y_ext);

if use_previous_data == 0 
    %seabed initialization
    addpath("./seabedFunctions");
    %creating matrix
    switch(shape)
        case "Plane"
            planeSeabed
            limits = [-303 -297]; %step, plane and sin
        case "Step"
            stepSeabed
            limits = [-303 -297];
        case "Sin product"
            sinProdSeabed
            limits = [-303 -297];
        case "Gaussian"
            gaussianSeabed
            limits = [-315 -285]; %gaussian
    end
    assignin('base','M_seabed', M_seabed);
    assignin('base','limits', limits);
    %mission simulation
    x_bar = .25;
    waitbar(x_bar, wb, "Mission simulation");
    echosounder
    assignin('base','M_eco_pow', M_eco_pow);
    %drawing mission path
    auvPath
    %depths from signals
    x_bar = .5;
    waitbar(x_bar, wb, "Post-mission data elaboration");
    postMissionElaboration
    %M_dep_samples = arrayfun(@(x) eco2R(x, SL, 0, 0), M_eco_pow);
    %M_dep_samples = eval(M_dep_samples);
else
    M_seabed = evalin('base', 'M_seabed');
    M_dep_samples = evalin('base','M_dep_samples');
    limits = evalin('base','limits');
end
%data format for algoritm
[samples_XY, samples] = matrix2scatteredData(M_dep_samples, Dx_index, Dy_index, res_x, res_y);
[seabed_XY, seabed_values] = matrix2scatteredData(M_seabed(1:res_x, 1:res_y), 1, 1, res_x, res_y);
[samples_X, samples_Y] = ndgrid(1:Dx_index:(N_x*Dx_index), 1:Dy_index:(N_y*Dy_index));
[seabed_X, seabed_Y] = ndgrid(1:1:res_x, 1:1:res_y);


plotSurface(-M_seabed(1:res_x, 1:res_y), "Seabed", limits);
x_bar = .75;
waitbar(x_bar, wb, "Interpolation");
switch(interpolation)
    case "Linear"
        linearInterpolation
    case "RBF"
        RBFInterpolation
    case "Natural Neighbour"
        naturalNeighbourInterpolation
    case "Nearest Neighbour"
        nearestNeighbourInterpolation
    case "Kriging"
        krigingInterpolation
    case "Shepard"
        shepardInterpolation
    case "Minimum Curvature"
        minimumCurvatureInterpolation
    case "Biharmonic Spline"
        v4Interpolation
    case "Spline"
        splineInterpolation
end
close(wb)
clear wb x_bar
% d = dialog('Position',[300 300 250 150],'Name','Result');
% uicontrol('Parent',d,...
%            'Style','text',...
%            'Position',[20 80 210 100],...
%            'FontSize',11,...
%            'String',sprintf("Execution time (s): %f \nMSE(m): %f", time, error));
% clear d
msgbox(sprintf("Execution time (s): %d \nMSE(m): %d", time, error), "result", "help");
fprintf("%d \n%d\n", time, error);
figure
% figure
hold on
plot(samples_XY(:,1),samples_XY(:,2),'*r')
% Draw lines
th = linspace(-pi/2,pi/2);
for j=1:N_y
    plot(samples_X(:,j),samples_Y(:,j),'b');
    cy = samples_Y(1,j)+Dy_index/2;
    r = Dy_index/2;
    if mod(j, 2) == 1
        cx = (N_x - 1) * Dx_index + 1;
        a = [r * cos(th) + cx ; r * sin(th) + cy];
    else
        cx = 1;
        a = [- r * cos(th) + cx ; r * sin(th) + cy];
    end
    if j ~= N_y
        plot(a(1, :), a(2, :), 'b');
    end
end
plot(seabed_X(1:res_x,1),seabed_Y(1:res_x,1),'g-');
plot(seabed_X(1,1:res_y),seabed_Y(1,1:res_y),'g-');
plot(seabed_X(1:res_x,res_y),seabed_Y(1:res_x,res_y),'g-');
plot(seabed_X(res_x,1:res_y),seabed_Y(res_x,1:res_y),'g-');
