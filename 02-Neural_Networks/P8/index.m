% Practice 8: by Pablo Domínguez Durán 
% Instructions:
% • Implement the backpropagation algorithm for the approximation problem 
% • Test your algorithm

% Constants
p = -2:0.1:2;
g = 1 + sin(pi * p / 4);
%% Variables initialization 
% Target
t = g;

% For first layer: 2 neurons
W1_old = rand(2,1);
b1_old = rand(2,1);

% For seconde layer: 1 neuron
W2_old = rand(1,2);
b2_old = rand(1,1);

alpha = 0.1;
%% Training

epochs = 100;
a2 = zeros(1, length(p));
W1 = W1_old;
b1 = b1_old;
W2 = W2_old;
b2 = b2_old;

for i = 1:epochs
    for j = 1 : length(p)
        %=========BACKPROGATION ALGORITHM==========
        % Step 1: propagate forwards
        a1 = logsig(W1 * p(j) + b1);
        a2(j) = purelin(W2 * a1 + b2);
        
        e = t(j) - a2(j);
        
        %Step 2: propagate sensitivities backwards
        s2 = - 2 * 1 * e;  %First derivative of purelin, a2.
        s1 = [(1 - a1(1)) * a1(1), 0; 0, (1 - a1(2)) * a1(2)] * W2' * s2;
        
        %Step 3: Calculate new W's and b's using learning rules
        W2 = W2 - alpha * s2 * a1';
        b2 = b2 - alpha * s2;
        
        W1 = W1 - alpha * s1 * p(j);
        b1 = b1 - alpha * s1;
    end
end
%% Comparison Graph

figure(1)
title('Backpropagation Approximation')
hold on

plot(p,g,'DisplayName','Pattern','LineWidth',2)
hold on
plot(p, a2, '--','DisplayName','Approximation','LineWidth',2)
hold on

% Axes
plot([-2 2],[0 0],'k','LineWidth',1,'HandleVisibility','off')
hold on
plot([0 0],[-.5 2.5],'k','LineWidth',1,'HandleVisibility','off')

grid on
legend()