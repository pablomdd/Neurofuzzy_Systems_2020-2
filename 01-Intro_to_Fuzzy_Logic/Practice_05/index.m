%Practice 05

%FIS by Sugeno method

clear all, close all, clc
step = 0.01;
e = -20 : step : 20;
a = 0.9;

%Membership Functions
% NG = sigmf(e, [-0.5*a -10]);
% NP = gbellmf(e, [2.5 a -7.5]);
% C = gbellmf(e, [5 a 0]);
% PP = gbellmf(e, [2.5 a 7.5]);
% PG = sigmf(e, [0.5*a 10]);

NG = SigmoideMF(-0.5*0.9, -10, -20, 20, step);
NP = BellMF(2.5, 0.9, -7.5, -20, 20, step);
C = BellMF(5, 0.9, 0, -20, 20, step);
PP = BellMF(2.5, 0.9, 7.5, -20, 20, step);
PG = SigmoideMF(0.5*0.9, 10, -20, 20, step);

subplot(2,1,1)
title('Membership Functions')
hold on
plot(e, NG, e, NP, e, C, e, PP, e, PG,'LineWidth',2);
axis([-20 20 0 1])
hold off


v = zeros(1,length(e));
for i=1:length(e)
   W = [NG(i) NP(i) C(i) PP(i) PG(i)];
   
   f1 = -12;
   f2 = 2*e(i) + 8;
   f3 = 0.4*e(i);
   f4 = 2*e(i) - 8;
   f5 = 12;
   
   v(i) = (W(1)*f1 + W(2)*f2 + W(3)*f3 + W(4)*f4 + W(5)*f5)/(sum(W));
end

subplot(2,1,2)
title('FIS Sugeno')
hold on
plot(e, v, 'LineWidth',2)
hold off





