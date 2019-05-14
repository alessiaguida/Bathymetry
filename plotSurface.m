function plotSurface(M, name, limits)
figure('Name',name,'NumberTitle','off')
%subplot(1,2,1);
subplot(2,1,1);
s = pcolor(M);
s.EdgeColor = 'none';
xlabel("X [m]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', t/100)
ylabel("Y [m]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', t/100)
c = colorbar;
caxis(limits);
c.Label.String = "Depth [m]";
subplot(2,1,2);
%subplot(1,2,2);
mesh(M);
xlabel("X [m]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', t/100)
ylabel("Y [m]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', t/100)
zlabel("Depth [m]");
zlim(limits);
caxis(limits);
colorbar;
end