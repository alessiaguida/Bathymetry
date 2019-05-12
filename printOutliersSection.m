i = 1;
figure
subplot(1,2,1);
plot(-M_seabed( (i-1) * Dx_index + 1, 1:1000))
hold on
plot(1:Dy_index:1001, -(z_auv + old_samples(i,:)),'o');
hold off
subplot(1,2,2);
plot(-M_seabed( (i-1) * Dx_index + 1, 1:1000))
hold on
plot(1:Dy_index:1001, -(z_auv + M_dep_samples(i,:)),'o');
hold off