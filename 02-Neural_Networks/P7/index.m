%% Practice 7: Multilayer NN Happy Face(with Perceptron)
% • Draw a happy face using geometric figures
% • Propose the limit lines for the first layer, al least 18 

%% First Layer: Classification
%   Following values were calculated by hand
W1 = [  1       0;    % W1_1
        -0.1    0.2;
        -0.1    0;
        0.1     -0.2;
        -0.1    -0.2;   % W1_5
        1       0;    
        0.1     0.2;
        0.2     -0.1;
        -0.2    -0.1;
        0       1;    % W1_10
        0       1;
        -1      0;
        0       -1;
        1       0;
        0       1;      %W1_15
        -1      0;
        0       -1;
        1       0;
        -1      0
     ];
 
 b1 = [
        -6;
        0.4;
        0.8;
        -0.2;
        0.8;    %b1_5
        -2;
        -0.6
        -0.4
        1.6;
        -4;      %b1_10
        -8;
        4;
        10;
        -2;
        -8;      %b1_15
        8;
        10;
        -6;
        4
 ];

% P = [5;5];
a1 = hardlim(W1 * P + b1);

%% Second Layer: Closing into a figure
% In this layer we filter the result by geometric figure.
% As we have 4 figures, we need 4 neurons:

W2 = [
        1   1   1   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0;
        0   0   0   0   1   1   1   0   0   0   0   0   0   0   0   0   0   0   1;
        0   0   0   0   0   0   0   1   1   1   0   0   0   0   0   0   0   0   0;
        0   0   0   0   0   0   0   0   0   0   1   1   1   1   0   0   0   0   0;
        0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   1   1   1   0;
];

b2 = [
        -3.5;
        -3.5;
        -2.5;
        -3.5;
        -3.5;
];

a2 = hardlim(W2 * a1 + b2)

%% Third Layer: (OR Gate) Point is inside a figure?
% In this layer we paint in one area what points are inbetween any of out
% figures:
% This, in practice is an OR gate.

W3 = [1   1   1   1   1];

b3 = -0.5;
% a3 = hardlim(W3 * a2 + b3);
%% Testing

x0 = -0:0.1:10;
y0 = -0:0.1:12;

figure(1)
title('Testing - Third Layer')
hold on
for i = 1:length(x0)
   for j = 1:length(y0)
        P = [x0(i); y0(j)];
        
%        First Layer evaluation
        a1 = hardlim(W1 * P + b1);
%         Second Layer evaluation
        
        a2 = hardlim(W2 * a1 + b2);
        
%          Third Layer Evaluation
        a3 = hardlim(W3 * a2 + b3);
        
        if (a3 == 1)
            plot(x0(i), y0(j), '*r');
        else
            plot(x0(i), y0(j), '*g');
        end
        hold on

   end
end


