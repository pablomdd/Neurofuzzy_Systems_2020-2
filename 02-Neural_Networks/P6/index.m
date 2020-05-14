%% Practice 6: Multilayer NN (with Perceptron)
% INSTRUCTIONS:
% • Propose a drawing with a triangle in the cartesian plane 
% • Calculate the limit lines for the first layer (sides of the triangle

%   For the first-layer neurons we proposee:
x0 = -4:0.2:8;
y0 = -4:0.2:8;
y1 = 2 * x0;
y2 = 1;
y3 = - x0 + 6;

figure(1)
title('Proposed Neurons - First Layer');
hold on
plot(x0, y1, 'DisplayName', 'N1','LineWidth',1);
hold on
plot([-4 8], [1 1], 'DisplayName', 'N2', 'LineWidth',1);
hold on
plot(x0, y3, 'DisplayName', 'N3', 'LineWidth',1);
legend()
grid on

xlim([-4 8]);
ylim([-4 8]);

%% Obtaining W and b for the first-layer Neurons
% • Calculate W in the first layer 
% • Calculate b in the first layer 

% We make this calculation by hand, and got: 
W1 = [  0.2     -0.1; 
        -0.1    -0.1; 
        0       0.1
    ];
b1 = [  0   ; 
        0.6 ; 
        0
     ];

%% Second Layer Neuron
% • Propose W in the second layer [1 1 1] 
% • Calculate b in second layer with the inequations 

W2 = [1 1 1];

% So, b in this layer is solved trought the following inequation
% -3 <= b < -2
% We give a random value  between this range
b2 = -(rand(1) + 2);

figure(2)
title('Testing - Second Layer')
hold on
for i = 1:length(x0)
   for j = 1:length(y0)
%        First Layer evaluation
        a1_1 = hardlim(W(1,:) * [x0(i); y0(j)] + b1(1));
        a1_2 = hardlim(W(2,:) * [x0(i); y0(j)] + b1(2));
        a1_3 = hardlim(W(3,:) * [x0(i); y0(j)] + b1(3));
%         Second Layer evaluation
        a_2 = hardlim(W2 * [a1_1 ; a1_2 ; a1_3] + b2);
        
        if (a_2 == 1)
            plot(x0(i), y0(j), '*r');
            hold on
        else
            plot(x0(i), y0(j), '*g');
            hold on
        end
   end
end
grid on