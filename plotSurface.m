function plotSurface(M, name, limits)
dx = 0.1;
figure('Name',name,'NumberTitle','off')
%subplot(1,2,1);
subplot(2,1,1);
s = pcolor(M);
s.EdgeColor = 'none';
xlabel("X [m]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', t*dx)
ylabel("Y [m]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', t*dx)
c = colorbar;
caxis(limits);
c.Label.String = "Depth [m]";
subplot(2,1,2);
%subplot(1,2,2);
mesh(M);
xlabel("X [m]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', t*dx)
ylabel("Y [m]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', t*dx)
zlabel("Depth [m]");
zlim(limits);
caxis(limits);
colorbar;
end