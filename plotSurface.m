%function to plot a matrix representig a surface
function plotSurface(M, name, limits, dx, dy, label,offset_x,offset_y)
if(nargin == 3)
    %default values
    dx = 0.1;
    dy = 0.1;
    label = "m";
end
if nargin ~= 8
    offset_x = 0;
    offset_y = 0;
end
figure('Name',name,'NumberTitle','off')
subplot(1,2,1); %orizontal
%subplot(2,1,1); %vertical
%2D plot
s = pcolor(M);
s.EdgeColor = 'none';
xlabel("X ["+label+"]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', floor((t+offset_y)*dy))
ylabel("Y ["+label+"]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', floor((t+offset_x)*dx))
%color bar on the first plot if required
%c = colorbar;
caxis(limits);
%c.Label.String = "Depth [m]";
subplot(1,2,2); %orizontal
%subplot(2,1,2); %vertical
%3D plot
mesh(M);
xlabel("X ["+label+"]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', floor((t+offset_y)*dy))
ylabel("Y ["+label+"]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', floor((t+offset_x)*dx))
zlabel("Depth [m]");
zlim(limits);
caxis(limits);
colorbar;
end