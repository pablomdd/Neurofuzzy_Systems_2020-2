%% Adaline 1-Layer
% ============== In this section we initalize W and b values ==============
% Pattern declaration
p1 = [1; 2];
p2 = [-1; 1];
p3 = [0; -1];

P = [p1 p2 p3];
Ptrans = P';
T = [1 -1 -1];
[m, n] = size(P);
N = 1;

% Inilialize W and b with random values
W_old = rand(N,m);
b_old = rand(N,1);
%% 1-Layer Adaline: Training

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
    % Graphs for the error
    if(i == 10)
        
        s = 'Error Graph after 10 epochs.';

        figure(1)
        title(s) 
        hold on
        plot(1:length(eStore), eStore,'LineWidth',2.0);
        grid on
        hold off
    end
    if(i == 50)
        % Graph for the error
        s = strcat('Error Graph after ', num2str(epochs),' epochs.');

        figure(2)
        title(s) 
        hold on
        plot(1:length(eStore), eStore,'LineWidth',2.0);
        grid on
    end
end

% Graph for the error
% s = strcat('Error Graph after ', num2str(epochs),' epochs.');
% 
% figure(1)
% title(s) 
% hold on
% plot(1:length(eStore), eStore);
% grid on
%% 1-Layer Adaline: Evaluation from -3 < x < 3

x0 = -3:0.1:3;
y0 = -3:0.1:3;

figure(3)

title('1-Layer Adaline NN')
hold on

for i = 1:length(x0)
    for j = 1:length(y0)
        
        a = purelin(W_new * [x0(i); y0(j)] + b_new);
        if( a >= 0)
            
            plot(x0(i) , y0(j), '*g')
        
        else
            plot(x0(i) , y0(j), '*m')
            
        end
        hold on
    end
end

grid on
xlim([-3 3])
ylim([-3 3])

%% Plotting the Patterns and Limit line

%   To obtain the limit line, let's get the equation 
b = b_new;
w = W_new;

phorizontal = - b / w(1);
pvertical = - b / w(2);

m = - pvertical / phorizontal;
y = m * x0 + pvertical;

mw = - 1 / m;
yw = mw * x0;

figure(4)
title('1-Layer Adaline Limit Line and W')
hold on

plot(x0, y, 'r', 'LineWidth',2,'DisplayName','Line Limit')
hold on
plot(x0, yw, 'b', 'LineWidth',2,'DisplayName','Weight')
hold on
legend()

plot(p1(1), p1(2), 'og', 'LineWidth', 1, 'DisplayName','P1')
hold on
plot(p2(1), p2(2), 'om', 'LineWidth', 1, 'DisplayName','P2')
hold on
plot(p3(1), p3(2), 'om', 'LineWidth', 1, 'DisplayName','P3')
hold on

grid on
xlim([-3 3])
ylim([-3 3])