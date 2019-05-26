function plotSurface(M, name, limits,dx,dy,label)
if(nargin == 3)
    dx = 0.1;
    dy = 0.1;
    label = "m";
end
figure('Name',name,'NumberTitle','off')
%subplot(1,2,1);
subplot(2,1,1);
s = pcolor(M);
s.EdgeColor = 'none';
xlabel("X ["+label+"]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', floor(t*dx))
ylabel("Y ["+label+"]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', floor(t*dy))
c = colorbar;
caxis(limits);
c.Label.String = "Depth [m]";
subplot(2,1,2);
%subplot(1,2,2);
mesh(M);
xlabel("X ["+label+"]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', floor(t*dx))
ylabel("Y ["+label+"]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', floor(t*dy))
zlabel("Depth [m]");
zlim(limits);
caxis(limits);
colorbar;
end