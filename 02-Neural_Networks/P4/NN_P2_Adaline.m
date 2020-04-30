%% Perceptron and training
clc, clear all, close all
P = [2 2 -2 -1 -1 -2 2 3;
     2 3 1 2 -1 -2 -3 -3];
Ptrans = P';

% Target
T =[1 1 1 1 -1 -1 -1 -1;
    -1 -1 1 1 1 1 -1 -1];

[m, n] = size(P);
N = 2; %Number of neurons

% Random W and b
W_old = rand(N,m);
b_old = rand(N,1);
%% 2-Layer Adaline Training
W_new = W_old;
b_new = b_old;

% Ask input for epochs
% prompt = 'Ingrese valor para epocas ';
% epochs = input(prompt);
epochs = 50;

% Alfa
alfa = 0.01;
eStore = zeros(N, epochs * n);
% k is the index for storing the error
k = 1;

% Training Algorithm
for i = 1:epochs
    for j = 1:n     %n is number of patterns        
        a = purelin(W_new * P(:,j) + b_new);

        e = T(:,j) - a;
        W_new =  W_new + alfa * e * Ptrans(j,:);
        b_new = b_new + alfa * e;
        
        eStore(:,k) = e;
        k = k + 1;
    end
end

figure(4)
% Graph for the error
s = strcat('Error Graph after ', num2str(epochs),' epochs. Alfa = ', num2str(alfa));
title(s) 

hold on
plot(1:length(eStore), eStore,'LineWidth',2.0);
legend('Error 1','Error 2');
grid on
%% Evaluation from -3 < x < 3

x0 = -3:0.1:3;
y0 = -3:0.1:3;

% We obtain b with the following values of w11, w12, w21, w22
w = W_new;
b = b_new;

figure(2)

title('2-Layer Adaline')
hold on

for i = 1:length(x0)
    for j = 1:length(y0)
        a = purelin( w * [x0(i); y0(j)] + b );
        
        if( a(1) >= 0 && a(2) >= 0 )
            
            plot(x0(i) , y0(j), '*g')
         
        elseif ( a(1) >= 0 && a(2) < 0 )
            plot(x0(i) , y0(j), '*m')
            
        elseif ( a(1) < 0 && a(2) > 0 )
            plot(x0(i) , y0(j), '*b')
            
        elseif ( a(1) < 0 && a(2) < 0 )
            plot(x0(i) , y0(j), '*r')
        end
        hold on
    end
end

plot(x0, y1, 'k', 'LineWidth', 2)
hold on
plot(x0, y2, 'k', 'LineWidth', 2)
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
title('2-Layer Adaline')
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