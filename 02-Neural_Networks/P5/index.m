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
T_per =[0 0 0 0 1 1 1 1]; 
T_ada =[-1 -1 -1 -1 1 1 1 1];

[m, n] = size(P);
N = 1; %Number of neurons

% Random W and b
W_old = rand(N,m);
b_old = rand(N,1);

%% Calculation of the learning rate (alpha)
R = 0;

for i = 1:n
    temp = (1 / n) * P(: , i) * Ptrans(i , :);
    R = R + temp;
end

lambda_max = max(eig(R));

% For this practice We experiment different values for alfa:
alpha1 = 1/(4 * lambda_max);
alpha2 = 1/(8 * lambda_max);
alpha3 = 1/(16 * lambda_max);

%% Simuntanoues Training with Perceptron and Adaline
% For this practice we test for 20, 50 and 100 epochs with adaline
epochs = 100;

W_per = W_old;
b_per = b_old;
W_ada1 = W_old;
b_ada1 = b_old;

eStore_per = zeros(N, epochs * n);
eStore_ada1 = zeros(N, epochs * n); % For alpha 1
eStore_ada2 = zeros(N, epochs * n); % For alpha 2
eStore_ada3 = zeros(N, epochs * n); % For alpha 3
% k is the index for storing the error
k = 1;

% Training Algorithm
for i = 1:epochs
    for j = 1:n     %n is number of patterns   
        % =========== Percetrone training ===========
        a_per = hardlim(W_per * P(:,j) + b_per);
        e_per = T_per(:,j) - a_per;
        
        W_per = W_per + e_per * Ptrans(j,:);
        b_per = b_per + e_per;
        
        eStore_per(:,k) = e_per;
        k = k + 1;
        % ============ Adaline training =============
        a_ada = purelin(W_ada1 * P(:,j) + b_ada1);

        e_ada = T_ada(:,j) - a_ada;
        W_ada1 =  W_ada1 + alpha1 * e_ada * Ptrans(j,:);
        b_ada1 = b_ada1 + alpha1 * e_ada;
        
        eStore_ada1(:,k) = e_ada;
        k = k + 1;
    end
end

k = 1;
W_ada2 = W_old;
b_ada2 = b_old;
for i = 1:epochs
    for j = 1:n     %n is number of patterns   
        % ============ Adaline training - alpha 2 =============
        a_ada = purelin(W_ada2 * P(:,j) + b_ada2);

        e_ada = T_ada(:,j) - a_ada;
        W_ada2 =  W_ada2 + alpha2 * e_ada * Ptrans(j,:);
        b_ada2 = b_ada2 + alpha2 * e_ada;
        
        eStore_ada2(:,k) = e_ada;
        k = k + 1;
    end
end

k = 1;
W_ada3 = W_old;
b_ada3 = b_old;
for i = 1:epochs
    for j = 1:n     %n is number of patterns   
        % ============ Adaline training - alpha 3 =============
        a_ada = purelin(W_ada3 * P(:,j) + b_ada3);

        e_ada = T_ada(:,j) - a_ada;
        W_ada3 =  W_ada3 + alpha3 * e_ada * Ptrans(j,:);
        b_ada3 = b_ada3 + alpha3 * e_ada;
        
        eStore_ada3(:,k) = e_ada;
        k = k + 1;
    end
end


%% Graphs

% Graph for the error
figure(1)
s = strcat('Error Graph after ', num2str(epochs),' epochs.');

title(s) 
hold on

subplot(2,2,3)
plot(1:length(eStore_per), eStore_per,'DisplayName', 'Perceptron Error','LineWidth',1.5);
hold on

subplot(2,2,4)
plot(1:length(eStore_ada1), eStore_ada1,'--','DisplayName', 'Alpha1','LineWidth',0.5);
hold on
plot(1:length(eStore_ada2), eStore_ada2,'DisplayName', 'Alpha2','LineWidth',1);
hold on
plot(1:length(eStore_ada3), eStore_ada3,'DisplayName', 'Alpha3','LineWidth',0.5);
legend()
grid on

% ================== Limit Lines =======================
%% Plotting the Patterns and Limit line

%   To obtain the limit line, let's get the equation 
x0 = -6:0.1:6;
y0 = -6:0.1:6;

% For perceptron
ph_per = - b_per / W_per(1);
pv_per = - b_per / W_per(2);

m_per = - pv_per / ph_per;
y_per = m_per * x0 + pv_per;

% For Adaline alpha1
ph_ada1 = - b_ada1 / W_ada1(1);
pv_ada1 = - b_ada1 / W_ada1(2);

m_ada1 = - pv_ada1 / ph_ada1;
y_ada1 = m_ada1 * x0 + pv_ada1;

% For Adaline alpha2
ph_ada2 = - b_ada2 / W_ada2(1);
pv_ada2 = - b_ada2 / W_ada2(2);

m_ada2 = - pv_ada2 / ph_ada2;
y_ada2 = m_ada2 * x0 + pv_ada2;

% For Adaline alpha3
ph_ada3 = - b_ada3 / W_ada3(1);
pv_ada3 = - b_ada3 / W_ada3(2);

m_ada3 = - pv_ada3 / ph_ada3;
y_ada3 = m_ada3 * x0 + pv_ada3;


subplot(2,2,[1 2])
s = strcat('Perceptron vs Adaline @', num2str(epochs),' epochs.');
title(s)
hold on
% ==> Perceptron Limit Line
plot(x0, y_per, 'r', 'LineWidth',2,'DisplayName','Limit Line Perceptron')
hold on
% ==> Adaline alpha1 Limit Line
plot(x0, y_ada1, 'b', 'LineWidth',2,'DisplayName','Adaline Alpha1')
hold on
% ==> Adaline alpha2 Limit Line
plot(x0, y_ada2,'--', 'LineWidth',2,'DisplayName','Adaline Alpha1')
hold on
% ==> Adaline alpha3 Limit Line
plot(x0, y_ada3, '--', 'LineWidth',2,'DisplayName','Adaline Alpha1')
hold on
legend()

% Here we graph the patterns
for j = 1:n
    coord = strcat( ' (', num2str(P(1,j)), ',', num2str(P(2,j)), ')' );
    s = strcat('P',num2str(j),' = ', coord);
    
    plot(P(1,j), P(2,j), 'ok', 'LineWidth', 1, 'DisplayName', s) 
    hold on 
end

grid on
xlim([-6 6])
ylim([-6 6])
%% Testing custom point

prompt = 'Enter a pattern to test as [x; y]: ';
userP = input(prompt);
% userP = [-2; -3; -4]; %Orange
% userP = [2; 3; 5]; %Apple
s1 = strcat(num2str(userP(1)), ' , ', num2str(userP(2)));

a_per = hardlim(W_per * userP(:,1) + b_per);
a_ada = purelin(W_ada3 * P(:,j) + b_ada3);
 
figure(2)
if (a_per == 0) 
    subplot(1,2,1)
    hold on
    img = imread('./rabbit.jpg'); imshow(img);    
    
    s = strcat('Perceptron: Pattern ', s1 , ' is a Rabbit');
    title(s);
    hold off
else    
    subplot(1,2,1)
    img = imread('./bear.jpg'); imshow(img);
    
    s = strcat('Perceptron: Pattern ', s1 , ' is a Bear');
    title(s);
    hold off
end

if (a_ada < 0) 
    subplot(1,2,2)
    hold on
    img = imread('./rabbit.jpg'); imshow(img);    
    
    s = strcat('Adaline: Pattern ', s1 , ' is a Rabbit');
    title(s);
    hold off
else    
    subplot(1,2,2)
    img = imread('./bear.jpg'); imshow(img);
    
    s = strcat('Adaline: Pattern ', s1 , ' is a Bear');
    title(s);
    hold off
end
