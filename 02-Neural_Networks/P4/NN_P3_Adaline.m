% Practice 3 NN: 3-Layer with Adaline
% Classify Oranges and Apples
%                           Intructions:
% • Plot in 3D that shows the points and the plane that separates the
% points
% • Ask the user for a point, classify with the algorithm and show an
% image of an apple or an Orange
% • Copy the 3D graph in a Word document and make a sreen shot for 2
% examples when testing (one for Orange and one for apple)

%% 1-Layer Adaline, R=3
% ============Initialization===========
clc, clear all, close all
p1 = [1; -1; -1];   % Orange
p2 = [1; 1; -1];    % Apple

P = [p1 p2];
Ptrans = P';
T = [-1 1];
[m, n] = size(P);
N = 1;  %   Number of Neurons

W_old = rand(N,m);
b_old = rand(N,1);

%% 1-Layer Adaline, R=3, training

% For this practice we test for 10 and 50 epochs
epochs = 50;
W_new = W_old;
b_new = b_old;

% Alfa
alfa = 0.1;
eStore = zeros(1, epochs * n);
% k is the index for storing the error
k = 1;

% Training with Adaline
for i = 1:epochs
    for j = 1:n     %n is number of patterns
        a = purelin(W_new * P(:,j) + b_new);
        
        e = T(j) - a;
        W_new =  W_new + alfa * e * Ptrans(j,:);
        b_new = b_new + alfa * e;
        
        eStore(k) = e;
        k = k + 1;
    end
end

% Graph for the error
s = strcat('Error Graph after ', num2str(epochs),' epochs. Alfa = ', num2str(alfa));

figure(1)
title(s) 
hold on
plot(1:length(eStore), eStore,'LineWidth',2.0);
grid on

%% Graph of resulting plane from -3 < x,y < 3

% x0 = -3:0.1:3;
% y0 = -3:0.1:3;
[X, Y] = meshgrid(-3:0.5:3);

w = W_new;
b = b_new;

PY = - b / w(1);    %From Oranges
PX = - b / w(2);    %From Apples

%   From the plae equation, w is ortogonal to plane and with x & y points are known 
Z = ( 1 / w(3) ) * ( -w(1)*X - w(2)*Y + w(2) * PX );

figure(2)
title('Adaline R=3')
hold off

surf(X,Y,Z);

hold on
scatter3(1,-1,-1,'filled','y')
hold on
scatter3(1,1,-1,'filled','r')
hold on

legend('Dividing plane','Orange','Apple');
grid on

%% Evaluation of custom point

prompt = 'Enter a pattern to evalute as [x; y; z]: ';
userP = input(prompt);
% userP = [-2; -3; -4]; %Orange
% userP = [2; 3; 5]; %Apple
s1 = strcat(num2str(userP(1)), ' , ', num2str(userP(2)), ' , ', num2str(userP(3)));

a = purelin(W_new * userP(:,1) + b_new);

figure(3)
if (a < 0) 
    subplot(1,2,1)
    scatter3(userP(1), userP(2), userP(3), 'filled','y');
    hold on
    surf(X,Y,Z);
    grid on
    
    subplot(1,2,2)
    hold on
    img = imread('../P3/orange.jpg'); imshow(img);    
    
    s = strcat('Pattern ', s1 , ' is an Orange');
    title(s);
    hold off
else    
    subplot(1,2,1)
    scatter3(userP(1), userP(2), userP(3), 'filled','r');
    hold on
    surf(X,Y,Z);
    grid on
    
    subplot(1,2,2)
    hold on
    img = imread('../P3/apple.jpg'); imshow(img);
    
    s = strcat('Pattern: ', s1 , ' is an Apple');
    title(s);
    hold off
end


