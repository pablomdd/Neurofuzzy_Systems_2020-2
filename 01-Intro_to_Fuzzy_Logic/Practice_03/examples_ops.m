%Tnorm and Snorm Operations examples

%   Deninitions of fuzzy sets
X = 0:5;
A = [1 0.9 0.7 0.4 0.1 0];
B = [0 0 0.3 0.6 0.9 1];

%------------------------Tnorm Operations -------------------
figure(1)

%   Minimum product
subplot(2,2,1)
 
title('Tmin')
hold on
plot(X,A,X,B,X,Tmin(A,B),'--')
hold on
legend('A','B','Tmin(a,b)')
hold off

%   Algebraic product
subplot(2,2,2)
title('Tap')
hold on
plot(X,A,X,B,X,Tap(A,B),'--')
hold on
legend('A','B','Tap(a,b)')
hold off

%   Bound product
subplot(2,2,3)
title('Tbp')
hold on
plot(X,A,X,B,X,Tbp(A,B),'--')
hold on
legend('A','B','Tbp(a,b)')
hold off


%   Drastic product
subplot(2,2,4)
title('Tdp')
hold on
plot(X,A,X,B,X,Tdp(A,B),'--')
hold on
legend('A','B','Tdp(a,b)')
hold off


%------------------------Snorm Operations -------------------
figure(2)

%   Maximum Sum
subplot(2,2,1)
title('Smax')
hold on
plot(X,A,X,B,X,Smax(A,B),'--')
hold on
legend('A','B','Smax(a,b)','location','east')
hold off

%   Algebraic sum
subplot(2,2,2)
title('Sas')
hold on
plot(X,A,X,B,X,Sas(A,B),'--')
hold on
legend('A','B','Sas(a,b)','location','east')
hold off

%   Bound sum
subplot(2,2,3)
title('Sbs')
hold on
plot(X,A,X,B,X,Sbs(A,B),'--')
hold on
legend('A','B','Sbs(a,b)','location','east')
hold off


%   Drastic product
subplot(2,2,4)
title('Sds')
hold on
plot(X,A,X,B,X,Sds(A,B),'--')
hold on
legend('A','B','Sds(a,b)','location','east')
hold off



