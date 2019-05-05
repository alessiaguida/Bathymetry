%--------------MAIN---------------
clear;
clc;
close all;
%------variabili 
%--fondale
%dimensioni fondale
x = 50;
y = 50;
%spaziatura tra punti
dx = 0.1;
%profondità di base
z_base = 200;
%--echosounder
%potenza
SL = 190;
%soglia
DT = 80;
%frequenza
f = 100;
%durata impulso
Td = 1;
%risoluzione
N_x = 10;
N_y = 50;
%profondità di missione
z_auv = 100;
%-------corpo
fondale
echosounder
percorso

figure;
subplot(2,2,1);
sfond = pcolor(-M_fondale); %profondità "negative"
sfond.EdgeColor = 'none';
subplot(2,2,2);
s = pcolor(M_eco_pot);
s.EdgeColor = 'none';
subplot(2,2,3);
s = pcolor(M_percorso);
s.EdgeColor = 'none';