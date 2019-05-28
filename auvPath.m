mps2kn = 1.94384;
R = eval(eco2R(DT + N, SL, TS, alfa));
Tr = R / c;
v_up1 = (Dx_index * dx) / (2 * Tr + Td);
v_up1 = v_up1 * mps2kn;
v_up2 = (PRmax + 1) * Dx_index * dx;
v_up2 = v_up2 * mps2kn;
v_lub = min(v_up1, v_up2);

assignin('base','v_up1', v_up1);
assignin('base','v_up2', v_up2);
assignin('base','v_lub', v_lub);

N_y
N_x
figure('Name', 'Mission path','NumberTitle','off')
% figure
hold on
plot(samples_Y-1, samples_X-1,'or')
% Draw lines
th = linspace(-pi/2,pi/2);
for j=1:N_x
    plot(samples_Y(j,:)-1,samples_X(j,:)-1,'b');
    cy = samples_X(j,1) - 1 + Dx_index/2;
    r = Dx_index/2;
    if mod(j, 2) == 1
        cx = (N_y - 1) * Dy_index;
        a = [r * cos(th) + cx ; r * sin(th) + cy];
        fx = cx + r;
    else
        cx = 0;
        a = [- r * cos(th) + cx ; r * sin(th) + cy];
        fx = cx - r;
    end
    if j ~= N_x
        plot(a(1, :), a(2, :), 'b');
        plot(fx, cy, 'b^', 'MarkerFaceColor', 'b');
    end
end
plot(seabed_Y(1:res_x,1)-1, seabed_X(1:res_x,1)-1,'k--');
plot(seabed_Y(1,1:res_y)-1, seabed_X(1,1:res_y)-1, 'k--');
plot(seabed_Y(1:res_x,res_y)-1, seabed_X(1:res_x,res_y)-1, 'k--');
plot(seabed_Y(res_x,1:res_y)-1, seabed_X(res_x,1:res_y)-1, 'k--');
title(sprintf("Maximum AUV velocity = %.2f kn", v_lub));
xlabel("X [m]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', floor(t*dy))
ylabel("Y [m]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', floor(t*dx))