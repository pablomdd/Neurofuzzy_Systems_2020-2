%%
% One Layer Neural Networks

x = -0.5:0.1:4;
y = -(2/3) * x + 2;

xw = 0:0.1:0.5;
yw = (3/2) * xw;

figure(1)
title('One Layer NN')
hold on

plot(x, y, 'r', 'LineWidth',2,'DisplayName','Line Limit')
hold on
plot(xw, yw, 'm', 'LineWidth',2,'DisplayName','Weight')
hold on
legend()
hold off

hold on
plot(2, 2, '*g', 'LineWidth',2)
hold on
plot(3, 1, '*g', 'LineWidth',2)
hold on
plot(0.5, 0.5, '*m','LineWidth',1)

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';


%% 

x2 = -4:0.2:4;
y2 = -4:0.2:4;
w = [0.2 0.3];
b = -0.6;

figure(2)
title('One Layer NN')
hold on

for i = 1:length(x2)
    for j = 1:length(y2)
        
        a = hardlim( dot( w, [x2(i); y2(j)] ) + b );
        
        if(a == 1)
            
            plot(x2(i) , y2(j), '*g')
         
        else
            plot(x2(i) , y2(j), '*m')
            
        end
        hold on
    end
end
hold on

% y = -(2/3) * x2 + 2;
% plot(x2, y, 'r', 'LineWidth',2,'DisplayName','Line Limit')
% ax = gca;
% ax.XAxisLocation = 'origin';
% ax.YAxisLocation = 'origin';
