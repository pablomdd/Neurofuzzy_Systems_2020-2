%Practica 02. Basic Operations
%   Given the fuzzy sets A,B,C calculate:

%   Deninitions of fuzzy sets
X = 0:0.1:10;
A =  A_MF(0,10,0.1);
B =  B_MF(0,10,0.1);
C =  C_MF(0,10,0.1);

% 1) Complements

Ac = zeros(1,length(X));
Bc = zeros(1,length(X));
Cc = zeros(1,length(X));

figure(1);
subplot(4,3,1)
title('A complement')
hold on
Ac = 1 - A; 
plot(X,A,X,Ac)
hold on
legend('A','A complement')
hold off

subplot(4,3,2)
title('B complement')
hold on
Bc = 1 - B;
plot(X,B,X,Bc)
hold on
legend('B','B complement')
hold off

subplot(4,3,3)
title('C complement')
hold on
Cc = 1 - C;
plot(X,C,X,Cc)
hold on
legend('C','C complement')
hold off

% 2) Unions

%A union B
subplot(4,3,4)
title('A U B')
hold on
AUB = max(A,B); 
plot(X,A,X,B)
hold on
plot(X,AUB,'*')
hold on
legend('A','B','A U B')
hold off

%A union C
subplot(4,3,5)
title('A U C')
hold on
AUC = max(A,C); 
plot(X,A,X,C)
hold on
plot(X,AUC,'*')
hold on
legend('A','C','A U C')
hold off

%B union C
subplot(4,3,6)
title('B U C')
hold on
BUC = max(B,C); 
plot(X,B,X,C)
hold on
plot(X,BUC,'*')
hold on
legend('B','C','B U C')
hold off


% 3) Intersections

%A intersection B
subplot(4,3,7)
title('A intersection B')
hold on
AIB = min(A,B); 
plot(X,A,X,B)
hold on
plot(X,AIB,'*')
hold on
legend('A','B','A intersection B')
hold off

%A intersection C
subplot(4,3,8)
title('A intersection C')
hold on
AIC = min(A,C); 
plot(X,A,X,C)
hold on
plot(X,AIC,'*')
hold on
legend('A','C','A intersection C')
hold off

%B intersection C
subplot(4,3,9)
title('B intersection C')
hold on
BIC = min(B,C); 
plot(X,B,X,C)
hold on
plot(X,BIC,'*')
hold on
legend('B','C','B intersection C')
hold off

% 4) De Morgan Law

% (A INTERSECTION Cc)c
subplot(4,3,10)
title('(A INTERSECTION Cc)c')
hold on
D = min(A,Cc); 

plot(X,A,X,Cc)
hold on
plot(X,1-D,'*')
hold on
legend('A','Cc','(A INTERSECTION Cc)c')
hold off

% (Bc intersection Cc)c
subplot(4,3,11)
title('(Bc intersection Cc)c')
hold on
F = min(Bc,Cc); 

plot(X,Bc,X,Cc)
hold on
plot(X,1-F,'*')
hold on
legend('Bc','Cc','(Bc intersection Cc)c')
hold off

% (A U C)c
subplot(4,3,12)
title('(A U C)c')
hold on

plot(X,A,X,C)
hold on
plot(X,1-AUC,'*')
hold on
legend('A','C','(A U C)c')
hold off

