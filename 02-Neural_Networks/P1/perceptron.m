%% Perceptron and training
p1 = [1; 2];
p2 = [-1; 1];
p3 = [0; -1];

P = [p1 p2 p3];
Ptrans = P';
T = [1 0 0];
[m, n] = size(P);
N = 1

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

%% Evaluation from -3 < x < 3

x0 = -3:0.1:3;
y0 = -3:0.1:3;

% We obtain b with the following values of w11, w12, w21, w22
w = Wnew;
b = bnew;

figure(2)

title('Perceptron')
hold on

for i = 1:length(x0)
    for j = 1:length(y0)
        
        a = hardlim( w * [x0(i); y0(j)] + b );
        if( a == 0)
            
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

phorizontal = - b / w(1);
pvertical = - b / w(2);

m = - pvertical / phorizontal;
y = m * x0 + pvertical;

mw = - 1 / m;
yw = mw * x0;

figure(1)
title('Perceptron')
hold on

plot(x0, y, 'r', 'LineWidth',2,'DisplayName','Line Limit')
hold on
plot(x0, yw, 'b', 'LineWidth',2,'DisplayName','Weight')
hold on
legend()

plot(p1(1), p1(2), 'om', 'LineWidth', 1, 'DisplayName','P1')
hold on
plot(p2(1), p2(2), 'og', 'LineWidth', 1, 'DisplayName','P2')
hold on
plot(p3(1), p3(2), 'om', 'LineWidth', 1, 'DisplayName','P3')
hold on

grid on
xlim([-3 3])
ylim([-3 3])
    