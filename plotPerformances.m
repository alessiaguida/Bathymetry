function plotPerformances(M)
    %M is structured as (name, time, mse)
    figure('Name', 'Performances','NumberTitle','off')
    [x y] = size(M);
    d = 0.05;
    for i=1:x
        plot(str2double(M(i,2)), str2double(M(i,3)),"x");
        text(str2double(M(i,2)) + d, str2double(M(i,3)) + d, M(i, 1));
    end
    xlabel("Time [s]");
    xlim([0 inf]);
    ylabel("MSE [m^2]");
    ylim([0 inf])
end