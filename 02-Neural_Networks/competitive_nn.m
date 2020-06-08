% Competitive Neural Networks Exercise
clc, clear all, close all
p1 = [-0.1961; 0.9806];
p2 = [0.1961; 0.9806];
p3 = [0.9806; 0.1961];
p4 = [0.9806; -0.1961;];
p5 = [-0.5812; -0.8137];
p6 = [-0.8137; -0.5812];

w1 = [0.7071; -0.7071];
w2 = [0.7071; 0.7071];
w3 = [-1.0000; 0.0000];

P = [p1 p2 p3 p4 p5 p6];
W = [w1'; w2'; w3'];
[m, n] = size(P);


%% Training
alpha = 0.2;
epochs = 20;
D = zeros(3,2);
L = zeros(3,1);

for i = 1 : epochs
    for k = 1: length(W)
        plot(W(k,1), W(k,2), 'pm', 'LineWidth',2)
        hold on
    end
    for j = 1 : n       
        a = compet(W * P(:,j));
        
        W = W + alpha * a .* (P(:,j)' - W);
    end
end
%% Plotting
figure(1)
s = 'Competitive Neural Networks';
title(s);
hold on
for i = 1 : n
    plot(P(1,i), P(2,i), '*b')
    hold on
end

% Plot W
for i = 1: length(W)
    plot(W(i,1), W(i,2), 'pg', 'LineWidth',2)
    hold on
end

grid on
xlim([-2 2])
ylim([-1 1])
    
    