% P12: Competitive NN by Pablo Dominguez

% Generate 5 sets with 10 random values each
% • Multiply/divide/add/subtract each set by a different factor such that you separate
% the sets slightly
% • Plot all the points, each set in a different colour (please do not use yellow)
% • Propose initial values for the weights as random (you need one weight per class)
% • Plot the weights with a different symbol each
% • Train the network to classify the 5 sets. (Ask the user for the number of epochs)
% • Test the network for all possible values in the cartesian plane such that you
% include the whole range of your random separated sets. Plot each class in a
% different colour
% • Upload your report including the code and the graphs, before and after the
% trainning

% Competitive Neural Networks Exercise
clc, clear all, close all
p1 = [rand(1,10) ; rand(1,10)];
p2 = [1 + rand(1,10) ; rand(1,10)];
p3 = [1 + rand(1,10) ; 2 + rand(1,10)];
p4 = [1 + rand(1,10) ; 1 + rand(1,10)];
p5 = [rand(1,10) ; 1.5 + rand(1,10)];

w1 = [rand() ; rand()];
w2 = [1 + rand() ; rand()];
w3 = [1 + rand() ; 2 + rand()];
w4 = [1 + rand() ; 1 + rand()];
w5 = [rand() ; 1.5 + rand()];

P = [p1 p2 p3 p4 p5];
W_old = [w1'; w2'; w3'; w4'; w5'];
[m, n] = size(P);
%% Original Patterns & Weights
figure(3)
s = 'Competitive Neural Networks';
title(s);
hold on
for i = 1 : 10
    plot(P(1,i), P(2,i), '*b')
    hold on
end
for i = 11: 20
    plot(P(1,i), P(2,i), '*g')
    hold on
end
for i = 21 : 30
    plot(P(1,i), P(2,i), '*c')
    hold on
end
for i = 31 : 40
    plot(P(1,i), P(2,i), '*r')
    hold on
end
for i = 41 : 50
    plot(P(1,i), P(2,i), '*k')
    hold on
end
plot(W_old(1,1), W_old(1,2), 'pm', 'LineWidth',2)
hold on
plot(W_old(2,1), W_old(2,2), 'xm', 'LineWidth',2)
hold on
plot(W_old(3,1), W_old(3,2), 'om', 'LineWidth',2)
hold on
plot(W_old(4,1), W_old(4,2), '^m', 'LineWidth',2)
hold on
plot(W_old(5,1), W_old(5,2), 'dm', 'LineWidth',2)
hold on

%% Training
W = W_old;
alpha = 0.2;
epochs = 15;
D = zeros(5,2);
L = zeros(5,1);

figure(1)
for i = 1 : epochs
    
    plot(W(1,1), W(1,2), 'pm', 'LineWidth',2)
    hold on
    plot(W(2,1), W(2,2), 'xm', 'LineWidth',2)
    hold on
    plot(W(3,1), W(3,2), 'om', 'LineWidth',2)
    hold on
    plot(W(4,1), W(4,2), '^m', 'LineWidth',2)
    hold on
    plot(W(5,1), W(5,2), 'dm', 'LineWidth',2)
    hold on
    
%     Training for the pattern 
    for j = 1 : n       
        a = compet(W * P(:,j));
        
        W = W + alpha * a .* (P(:,j)' - W);
    end
end
% Plotting

s = 'Competitive Neural Networks';
title(s);
hold on
for i = 1 : 10
    plot(P(1,i), P(2,i), '*b')
    hold on
end
for i = 11: 20
    plot(P(1,i), P(2,i), '*g')
    hold on
end
for i = 21 : 30
    plot(P(1,i), P(2,i), '*c')
    hold on
end
for i = 31 : 40
    plot(P(1,i), P(2,i), '*r')
    hold on
end
for i = 41 : 50
    plot(P(1,i), P(2,i), '*k')
    hold on
end

% Plot W
% for i = 1: length(W)
%     plot(W(i,1), W(i,2), 'pg', 'LineWidth',2)
%     hold on
% end
plot(W(1,1), W(1,2), 'pm', 'LineWidth',2)
hold on
plot(W(2,1), W(2,2), 'xm', 'LineWidth',2)
hold on
plot(W(3,1), W(3,2), 'om', 'LineWidth',2)
hold on
plot(W(4,1), W(4,2), '^m', 'LineWidth',2)
hold on
plot(W(5,1), W(5,2), 'dm', 'LineWidth',2)
hold on

grid on
xlim([0 3])
ylim([0 3])

% Testing
figure(2)
X = -5:0.2:5;
Y = -5:0.2:5;
s = strcat('Competitive NN:', num2str(epochs), 'epochs.' );
title(s);
hold on
for i = 1:length(X)
    for j = 1:length(Y)
        p = [X(i);Y(j)];
        a = compet(W * p);
       
        if a(1) == 1
            plot(X(i),Y(j), '*b')
        elseif a(2) == 1
            plot(X(i),Y(j), '*g')
        elseif a(3) == 1
            plot(X(i),Y(j), '*c')
        elseif a(4) == 1
            plot(X(i),Y(j), '*r')
        else
            plot(X(i),Y(j), '*k')
        end
        hold on
    end
end
grid on
xlim([-5 5])
ylim([-5 5])
    