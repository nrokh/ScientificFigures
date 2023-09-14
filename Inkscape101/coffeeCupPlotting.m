% plot of how good i feel vs. coffee consumption

% create fig
figure; hold on

% generate data (very experimental)
coffeeCups = [0:10];
goodness_NR = [0, 1, 2.5, 4, 4.5, 5, 5.5, 3, 1, 0, -3];
goodness_AS = [0, 0, 0, 0, 4, 5.5, 6.5, 8, 10, 10.5, 11];

% create plot
plot(coffeeCups, goodness_NR, '-o')
plot(coffeeCups, goodness_AS, '-o')
plot([0,10],[0,0], '--k') % base line of neutrality
xlabel('Cups of Coffee (standard)')
ylabel('How good I feel (normalized)')
legend('Nataliya', 'Andrew', 'Location', 'northwest')
grid on
box on 