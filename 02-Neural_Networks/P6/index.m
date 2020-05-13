%% Practice 6: Multilayer NN (with Perceptron)
% INSTRUCTIONS:
% • Propose a drawing with a triangle in the cartesian plane 
% • Calculate the limit lines for the first layer (sides of the triangle

%   For the first-layer neurons we proposee:
x0 = -4:02:8;
y1 = 2 * x0;
y2 = 1;
y3 = - x0 + 6;

figure(1)
title('Proposed Neurons');
hold on
plot(x0, y1, 'DisplayName', 'N1','LineWidth',1);
hold on
plot([-4 8], [1 1], 'DisplayName', 'N2', 'LineWidth',1);
hold on
plot(x0, y3, 'DisplayName', 'N3', 'LineWidth',1);
legend()
grid on

%% Obtaining W and b for the first-layer Neurons
% • Calculate W in the first layer 
% • Calculate b in the first layer 

% We make this calculation by hand, and got:
% y_ = 

%% 

W = [   0.2 0.4; 
        5.5 0.5; 
        0.2 1
    ];
b = [-1 ; -33 ; -0.2];


