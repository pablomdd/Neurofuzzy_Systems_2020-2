%   Two Layer NN

% Given the group of points in a bidimentional cartensian plane
% 3, 4
% 4, 3
% 
% -4, 3
% -3, 1
% 
% -3, -3
% -4, -4
% 
% 5, -1
% 4, -1
% Build two neurons to classify into 4 groups those areas
% --------------------------------------------------------------
%% 
x = -6:0.2:6;

% The neurons are propose as :
 y1 = (1/3) * x;
 y2 = -x + 1;
 
%  And, the weight values as:
xw1 = 0:0.2:0.5;
xw2 = -0.5:0.1:0;

yw1 = -3 * xw1;
yw2 = xw2;

figure(1)
title('Two Layer NN')
hold on

% For N1
plot(x, y1, 'r', 'LineWidth',2,'DisplayName','Line Limit N1')
hold on
plot(xw1, yw1, 'r', 'LineWidth',2,'DisplayName','Weight1')
hold on

% For N2
plot(x, y2, 'm', 'LineWidth',2,'DisplayName','Line Limit N2')
hold on
plot(xw2, yw2, 'm', 'LineWidth',2,'DisplayName','Weight2')
hold on

legend()
hold off

% Graphing points
hold on
plot(3, 4, '*g', 'LineWidth',1)
hold on
plot(4, 3, '*g', 'LineWidth',1)
hold on
plot(-4, 2, '*m','LineWidth',1)
hold on
plot(-3, 1, '*m','LineWidth',1)
hold on
plot(-3, -3, '*b','LineWidth',1)
hold on
plot(-4, -4, '*b','LineWidth',1)
hold on
plot(5, -1, '*r','LineWidth',1)
hold on
plot(4, -1, '*r','LineWidth',1)

grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
%% 
% In this section, let's graph the points in each class

% When a = [0; 0] section green (Nort East)
% When a = [0; 1] section magenta (Nort West)
% When a = [1; 1] section ble (South West)
% When a = [1; 1] section magenta (South East)

x0 = -6:0.1:6;
y0 = -6:0.1:6;

% We obtain b with the following values of w11, w12, w21, w22
w = [0.1 -0.3; -0.1 -0.1];
b= [0 ; 0.1];

figure(2)

title('Two Layer NN')
hold on

% For N1
plot(x, y1, 'r', 'LineWidth',2,'DisplayName','Line Limit N1')
hold on
% For N2
plot(x, y2, 'r', 'LineWidth',2,'DisplayName','Line Limit N2')

for i = 1:length(x0)
    for j = 1:length(y0)
        
        a = hardlim( w * [x0(i); y0(j)] + b );
        if( a(1) == 0 && a(2) == 0 )
            
            plot(x0(i) , y0(j), '*g')
         
        elseif ( a(1) == 0 && a(2) == 1 )
            plot(x0(i) , y0(j), '*m')
            
        elseif ( a(1) == 1 && a(2) == 1 )
            plot(x0(i) , y0(j), '*b')
            
        elseif ( a(1) == 1 && a(2) == 0 )
            plot(x0(i) , y0(j), '*r')
        end
        hold on
    end
end

grid on
xlim([-6 6])
ylim([-6 6])