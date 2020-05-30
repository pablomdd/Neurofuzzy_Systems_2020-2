% Practice 10: by Pablo Domínguez Durán 
% ============Initialization===========
clc, clear all, close all
% Here we call our patterns and targets available in different files
[P_heart, T_heart] = heart_dataset(1);
[P_other, T_other] = other_dataset(-1);

% We take a look to the patterns
figure(1)
for i = 1:length(P_heart)
   scatter(P_heart(i,1), P_heart(i,2), 'r') 
    hold on
end
for i = 1:length(P_other)
   scatter(P_other(i,1), P_other(i,2), 'xk') 
    hold on
end

%% Constants & variables

% #Patterns = Heart_Patterns + nonHeart_Patterns = 40x2 + 47x2 = 87x2
P = [P_heart; P_other];
P = P';
Ptrans = P';
% #Targets = 1x40 + 1x47 = 1x87
T = [T_heart, T_other];

[m, n] = size(P);
% ============= Network Design =============
% For this practice we have proposed a Two-Layer NN. 
% First Layer consists of 8 neurons which we expect to surround the heart
% area.
% Second Layer would be our AND gate to determine a point is within the
% area.

N_L1 = 8;   %Number of neurons First Layer
N_L2 = 1;   %Number of neurons Second Layer    

% For first layer: 8 neurons
W1_old = rand(N_L1, m);
b1_old = rand(N_L1, 1);

% For second layer: 1 neuron
W2_old = rand(N_L2, N_L1);
b2_old = rand(N_L2, 1);

%% Training
%   Vars for the training
alpha = 0.001;
epochs = 1000;

W1 = W1_old;
b1 = b1_old;
W2 = W2_old;
b2 = b2_old;

for i = 1 : epochs
    for j = 1 : n
        %=========BACKPROGATION ALGORITHM==========
        % Step 1: propagate forwards
        a1 = logsig(W1 * P(:,j) + b1);
        a2 = purelin(W2 * a1 + b2);
        
        e = T(j) - a2;
        
        % Step 2: propagate sensitivities backwards
        s2 = - 2 * 1 * e;  %First derivative of purelin, a2.
        
%         This function helps us to put together the necessary matix for
%         the sensivity s1.
        matrix = make_sensivity_matrix(a1);
        s1 = matrix * W2' * s2;
 
        %Step 3: Calculate new W's and b's using learning rules
        W2 = W2 - alpha * s2 * a1';
        b2 = b2 - alpha * s2;
        
        W1 = W1 - alpha * s1 * Ptrans(j,:);
        b1 = b1 - alpha * s1;
    end
end

%% Testing
x0 = -10:0.5:10;
y0 = -2:0.5:12;

figure(2)
s = strcat('Alpha = ', num2str(alpha), ', Epochs = ', num2str(epochs));
title(s);
hold on
for i = 1 : length(x0)
    for j = 1 : length(y0)
        a1 = logsig(W1 * [x0(i) ; y0(j)] + b1);
        a2 = purelin(W2 * a1 + b2);
        
        if(a2 >= 0)
            plot(x0(i), y0(j), 'xr');
        else
            plot(x0(i), y0(j), 'xg');
        end
        hold on
   end
end
grid on

