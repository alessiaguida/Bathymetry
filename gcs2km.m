%Geographic coordinate system to km
function [Lx, Ly] = gcs2km(x1, y1, x2, y2)
    %supposing small angles and earth perfectly spherical
    %supposing of being far from equator
    R = 6378137; %m at equator
    dx = abs(x1 - x2); %angle
    dy = abs(y1 - y2); %angle
    Ly = pi*R*dy/180*0.001; %km
    Ry = R*cos(((y1 + y2)/2)*pi/180); %m
    Lx = pi*Ry*dx/180*0.001;%km
end