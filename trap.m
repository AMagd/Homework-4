function trap(a, t1, tau)

% first part
time1 = linspace(0,t1,20);
p1 = a*time1;

% second part
time2 = linspace(t1, tau, 20);
p2 = p1(end)*ones(1,length(time2));

% last part
time3 = linspace(tau, tau+t1, 20);
c = p2(end) + a*time3(1);
p3 = -a*time3 + c;

p = [p1 p2 p3];
time = [time1 time2 time3];

plot(time, p, 'Color', [0 0 0], 'linewidth', 2)
hold on
plot(ones(1,20)*t1, linspace(0,p1(end),20), '--r')
plot(ones(1,20)*tau, linspace(0,p1(end),20), '--r')
plot([time1(1) time2(1) time3(1) time3(end)], [p1(1) p2(1) p3(1) p3(end)], '.', 'Color', '0.992 0.788 0.04 1','MarkerSize',20)


grid on
ylim([min(p) max(p)+mean(p)/2])

hold off