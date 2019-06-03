function plotPerformances(M)
    %M is structured as (name, mse, time)
    figure('Name', 'Performances','NumberTitle','off')
    [x y] = size(M);
    d = 0;
    hold on
    for i=1:x
        plot(str2double(M(i,3)), str2double(M(i,2)),"x",'MarkerSize',14,'LineWidth',3);
        text(str2double(M(i,3)) + d, str2double(M(i,2)) + d, M(i, 1), 'fontsize', 18);
    end
    xlabel("Time [s]");
    xlim([0 inf]);
    ylabel("MSE [m^2]");
    ylim([0 inf])
    grid on
    hold off
end