function plotSurface(M, name, limits, dx, dy, label)
if(nargin == 3)
    %default values
    dx = 0.1;
    dy = 0.1;
    label = "m";
end
figure('Name',name,'NumberTitle','off')
%subplot(1,2,1); %orizontal
subplot(2,1,1); %vertical
%2D plot
s = pcolor(M);
s.EdgeColor = 'none';
xlabel("X ["+label+"]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', floor(t*dy))
ylabel("Y ["+label+"]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', floor(t*dx))
c = colorbar;
caxis(limits);
c.Label.String = "Depth [m]";
%subplot(1,2,2); %orizontal
subplot(2,1,2); %vertical
%3D plot
mesh(M);
xlabel("X ["+label+"]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', floor(t*dy))
ylabel("Y ["+label+"]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', floor(t*dx))
zlabel("Depth [m]");
zlim(limits);
caxis(limits);
colorbar;
end