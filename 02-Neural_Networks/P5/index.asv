%% Adaline vs Perceptron. Obtaining alpha.
% Toy clasification: Rabbit vs Bears
% ============Initialization===========
clc, clear all, close all

% The following Patterns represent Rabbits with target
% t = 0 for Perceptron
% t = -1 for Adaline
P1 = [1 ; 4];
P2 = [1 ; 5];
P3 = [2 ; 4];
P4 = [2 ; 5];

% The following Patterns represent Bears with target
% t = 1 for Perceptron
% t = 1 for Adaline
P5 = [3 ; 1];
P6 = [3 ; 2];
P7 = [4 ; 1];
P8 = [4 ; 2];

% Thus, our P matrix

P = [P1 P2 P3 P4 P5 P6 P7 P8];
Ptrans = P';

% Target
T_percetron =[0 0 0 0 1 1 1 1];
T_adaline =[-1 -1 -1 -1 1 1 1 1];

[m, n] = size(P);
N = 1; %Number of neurons

% Random W and b
W_old = rand(N,m);
b_old = rand(N,1);

%% Simuntanoues Training
% For this practice we test for 20, 50 and 100 epochs with adaline
epochs = 50;
W_new = W_old;
b_new = b_old;



