%% Perceptron and training
clc, clear all, close all
% p1 = [1; 2];
% p2 = [-1; 1];
% p3 = [0; -1];

P = [2 2 -2 -1 -1 -2 2 3;
     2 3 1 2 -1 -2 -3 -3];
Ptrans = P';

T =[1 1 1 1 0 0 0 0;
    0 0 1 1 1 1 0 0];

[m, n] = size(P);
N = 2;

% Random W and b
Wnew = rand(N,m);
bnew = rand(N,1);

% Ask input for epochs
prompt = 'Ingrese valor para epocas ';
epochs = input(prompt);
% epochs = 10;

% Training Algorithm
for i = 1:epochs
    for j = 1:n     %n is number of patterns
        a = hardlim(Wnew * P(:,j) + bnew)
        e(:,j) = T(:,j) - a;
        
        Wnew =  Wnew + e(:,j) * Ptrans(j,:);
        bnew = bnew + e(:,j);
    end
end

%% Evaluation from -3 < x < 3

x0 = -3:0.1:3;
y0 = -3:0.1:3;

% We obtain b with the following values of w11, w12, w21, w22
w = Wnew;
b = bnew;

figure(2)

title('Perceptron')
hold on

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
xlim([-3 3])
ylim([-3 3])


%% Plotting the Patterns and Limit line

%   To obtain the limit line, let's get their line equation 
% For Limit Line 1
p1horizontal = - b(1) / w(1,1);
p1vertical = - b(1) / w(1,2);

m1 = - p1vertical / p1horizontal;
y1 = m1 * x0 + p1vertical;

mw1 = - 1 / m1;
yw1 = mw1 * x0;

% For Limit Line 2
p2horizontal = - b(2) / w(2,1);
p2vertical = - b(2) / w(2,2);

m2 = - p2vertical / p2horizontal;
y2 = m2 * x0 + p2vertical;

mw2 = - 1 / m2;
yw2 = mw2 * x0;

% Now, we plot the Line Limits and Weights
figure(1)
title('Perceptron')
hold on

plot(x0, y1, 'r', 'LineWidth',2,'DisplayName','Line Limit 1')
hold on
plot(x0, yw1, '--b', 'LineWidth',2,'DisplayName','Weight 1')
hold on
plot(x0, y2, 'g', 'LineWidth',2,'DisplayName','Line Limit 2')
hold on
plot(x0, yw2, '--m', 'LineWidth',2,'DisplayName','Weight 2')
hold on
legend()

% Here, we plot the Patterns automatically, and as well we label their
% coordinate
for j = 1:n     %n is number of patterns
    coord = strcat( ' (', num2str(P(1,j)), ',', num2str(P(2,j)), ')' );
    s = strcat('P',num2str(j),' = ', coord);
    
    plot(P(1,j), P(2,j), 'ok', 'LineWidth', 1, 'DisplayName', s)
    hold on
end

grid on
xlim([-3 3])
ylim([-3 3])