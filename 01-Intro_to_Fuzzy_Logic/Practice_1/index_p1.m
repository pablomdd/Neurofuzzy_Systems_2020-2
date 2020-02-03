%Index Of Practice 1

%We deep into membership functions of fuzzy sets, including:
%   Discrete Sets: Triangular, Trapzoidal
%   Continous Sets: Gaussian, Sigmoide, Bell

%For figure 1: Overlap the following MF's
%   universe: [0 200], step = 0.5
%   Triangular: a = 50, b = 100, c = 150 *purple*
%   Trapezoidal: a = 0, b = 0, c = 45, d =  80 *green*
%   Trapezoidal: a = 150, b = 155, c = 200, d = 200 *pink*

[X1,Y1] = TriangularMF(50, 100, 150,0,200,0.5);
[X2,Y2] = TrapezoidalMF(0, 0, 45,80,0,200,0.5);
[X3,Y3] = TrapezoidalMF(150, 155, 200,200,0,200,0.5);

figure(1)

subplot(2,3,1)
p1 = plot(X1, Y1, 'magenta');
hold on;

subplot(2,3,2)
p2 = plot(X2, Y2, 'green');
hold on;

subplot(2,3,3)
p3 = plot(X3,Y3, 'cyan');
hold on

subplot(2,3,[4 5 6])

p4 = plot(X1, Y1, 'magenta');
hold on;
plot(X2, Y2, 'green');
hold on;
plot(X3,Y3, 'cyan')

title('Discrete Membership Functions')
legend({'Triangular','Trapezoidal', 'Trapezoidal'}, 'Location','Southwest')


%For figure 2: Overlap the following MF's
%   universe: [0 200], step = 0.5
%   Bell: a = 40, b = 10, c = 0 *purple*
%   Gaussian: c = 100, sigma = 0 *green*
%   Sigmoide: a = 0.1,c = 140 *pink*

[X4,Y4] = BellMF(50, 100, 150,0,200,0.5);
[X5,Y5] =GaussianMF(0, 0, 45,80,0,200,0.5);
[X6,Y6] = SigmoideMF(150, 155, 200,200,0,200,0.5);

figure(2)

% subplot(2,3,1)
% p1 = plot(X1, Y1, 'magenta');
% hold on;
% 
% subplot(2,3,2)
% p2 = plot(X2, Y2, 'green');
% hold on;
% 
% subplot(2,3,3)
% p3 = plot(X3,Y3, 'cyan');
% hold on
% 
% subplot(2,3,[4 5 6])
% 
% p4 = plot(X1, Y1, 'magenta');
% hold on;
% plot(X2, Y2, 'green');
% hold on;
% plot(X3,Y3, 'cyan')
% 
% title('Discrete Membership Functions')
% legend({'Triangular','Trapezoidal', 'Trapezoidal'}, 'Location','Southwest')

