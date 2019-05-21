clc;
data = [1 0 ; 1 4 ; 2 4 ; 2 0 ; 3 0 ; 3 5];
figure
% figure
hold on
plot(samples_XY(:,1),samples_XY(:,2),'*r')
% Draw lines
for j=1:N_y
    plot(samples_X(:,j),samples_Y(:,j),'b');
end
plot(data(1:2,1),data(1:2,2),'b') ;
plot(data(3:4,1),data(3:4,2),'b') ;
plot(data(5:6,1),data(5:6,2),'b') ;
% draw curves 
th = linspace(0,pi) ;
c1 = sum(data(2:3,:))/2 ;
r = 0.5 ;
a1 = [r*cos(th)+c1(1) ; r*sin(th)+c1(2)] ;
plot(a1(1,:),a1(2,:))
c2 = sum(data(4:5,:))/2 ;
a2 = [r*cos(-th)+c2(1) ; r*sin(-th)+c2(2)] ;
plot(a2(1,:),a2(2,:))
hold off