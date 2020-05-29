% Practice 10: by Pablo Dom�nguez Dur�n 
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
% ============= Network Design =============
% #Patterns = Heart_Patterns + nonHeart_Patterns = 40x2 + 47x2 = 87x2
P = [P_heart; P_other];
P_trans = P';
% #Targets = 1x40 + 1x47 = 1x87
T = [T_heart, T_other];

[m, n] = size(P);
N_L1 = 8;   %Number of neurons First Layer
N_L2 = 1;   %Number of neurons Second Layer    

% =========== Variables ==============
% For first layer: 2 neurons
W1_old = rand(N_L1, m);
b1_old = rand(N_L1, 1);

% For second layer: 1 neuron
W2_old = rand(N_L2, N_L1);
b2_old = rand(N_L2, 1);

