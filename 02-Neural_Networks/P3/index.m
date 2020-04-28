% Practice 3 NN: 3-Layer Perceptron
% Classify Oranges and Apples
%                           Intructions:
% Plot in 3D that shows the points and the plane that separates the
% points
% • Ask the user for a point, classify with the algorithm and show an
% image of an apple or an Orange
% • Copy the 3D graph in a Word document and make a sreen shot for 2
% examples when testing (one for Orange and one for apple)

%% Perceptron and training
p1 = [1; -1; -1];   % Orange
p2 = [1; 1; -1];    % Apple

P = [p1 p2];
Ptrans = P';
T = [-1 1];
[m, n] = size(P);
N = 1;  %   Number of Neurons

Wnew = rand(N,m);
bnew = rand(N,1);

% Ask input for epochs
epochs = 10;

% Training
for i = 1:epochs
    for j = 1:n     %n is number of patterns
        a = hardlims(Wnew * P(:,j) + bnew);
        e = T(j) - a;
        
        Wnew =  Wnew + e * Ptrans(j,:);
        bnew = bnew + e;
    end
end

%% Graph of resulting plane from -3 < x,y < 3

% x0 = -3:0.1:3;
% y0 = -3:0.1:3;
[X, Y] = meshgrid(-3:0.5:3);

w = Wnew;
b = bnew;

PY = - b / w(1);    %From Oranges
PX = - b / w(2);    %From Apples

%   From the plae equation, w is ortogonal to plane and with x & y points are known 
Z = ( 1 / w(3) ) * ( -w(1)*X - w(2)*Y + w(2) * PX );

figure(2)
title('Perceptron R=3')
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

a = hardlims(Wnew * userP(:,1) + bnew);

figure(1)
if (a == -1) 
    subplot(1,2,1)
    scatter3(userP(1), userP(2), userP(3), 'filled','y');
    hold on
    surf(X,Y,Z);
    grid on
    
    subplot(1,2,2)
    hold on
    img = imread('orange.jpg'); imshow(img);    
    
    s = strcat('Pattern ', s1 , ' is an Orange')
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
    img = imread('apple.jpg'); imshow(img);
    
    s = strcat('Pattern: ', s1 , ' is an Apple');
    title(s);
    hold off
end


