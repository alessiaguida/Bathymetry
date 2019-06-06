%computing speed lower upper bound
mps2kn = 1.94384; %scale factor
R = eval(eco2R(DT + N, SL, TS, alfa));
Tr = R / c;
v_ub1 = (Dy_index * dy) / (2 * Tr + Td);
v_ub1 = v_ub1 * mps2kn;
v_ub2 = (PRmax + 1) * Dy_index * dy;
v_ub2 = v_ub2 * mps2kn;
v_lub = min(v_ub1, v_ub2);
if shape == "Mediterranean Sea"
    %Mediterranean seabed is in km scale
    v_ub1 = v_ub1 * 1000;
    v_ub2 = v_ub2 * 1000;
    v_lub = v_lub * 1000;
end
assignin('base','v_up1', v_ub1);
assignin('base','v_up2', v_ub2);
assignin('base','v_lub', v_lub);

figure('Name', 'Mission path','NumberTitle','off')
hold on
%plotting sample points
%trasposed to be coherent with the mesh and pcolor plots
plot(samples_Y-1, samples_X-1,'or')
%arc angles
th = linspace(-pi/2,pi/2);
for j=1:N_x
    %plotting path line
    plot(samples_Y(j,:)-1,samples_X(j,:)-1,'b');
    %y-coordinate of the curvature center
    cy = samples_X(j,1) - 1 + Dx_index/2;
    %curvature radius
    r = Dx_index/2;
    if mod(j, 2) == 1
        %x-coordinate of the curvature center
        cx = (N_y - 1) * Dy_index;
        a = [r * cos(th) + cx ; r * sin(th) + cy];
        %arrow coordinate
        fx = cx + r;
    else
        cx = 0;
        a = [- r * cos(th) + cx ; r * sin(th) + cy];
        fx = cx - r;
    end
    %not plotting if it's the last line
    if j ~= N_x
        plot(a(1, :), a(2, :), 'b');
        plot(fx, cy, 'b^', 'MarkerFaceColor', 'b');
    end
end
%plotting the area of interest limits
plot(seabed_Y(1:res_x,1)-1, seabed_X(1:res_x,1)-1,'k--');
plot(seabed_Y(1,1:res_y)-1, seabed_X(1,1:res_y)-1, 'k--');
plot(seabed_Y(1:res_x,res_y)-1, seabed_X(1:res_x,res_y)-1, 'k--');
plot(seabed_Y(res_x,1:res_y)-1, seabed_X(res_x,1:res_y)-1, 'k--');
title(sprintf("Maximum AUV velocity = %.2f kn", v_lub));
xlabel("X ["+label+"]");
t = get(gca, 'XTick');
set(gca, 'XTick', t, 'XTickLabel', floor(t*dy))
ylabel("Y ["+label+"]");
t = get(gca, 'YTick');
set(gca, 'YTick', t, 'YTickLabel', floor(t*dx))