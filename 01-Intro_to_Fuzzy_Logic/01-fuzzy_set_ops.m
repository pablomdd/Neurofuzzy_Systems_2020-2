A = [1 1 0.8 0.6 0.4 0.2 0]
B = [0 0.5 1 0.5 0 0 0]
X = 0:6

figure(1)
subplot(2,2,1)
plot(X,A,'r')

subplot(2,2,2)
plot(X,B,'g')

subplot(2,2,[3,4])
plot(X,A,'r')
hold on
plot(X,B,'g')
hold on
plot(X, min(A,B),'b')


%UNION A AND B
figure(2)
subplot(2,2,1)
plot(X,A,'r')

subplot(2,2,2)
plot(X,B,'g')

subplot(2,2,[3,4])
plot(X,A,'r')
hold on
plot(X,B,'g')
hold on
plot(X, max(A,B),'b')

%DIFFERENCE
figure(3)
subplot(2,2,[1,2])
plot(X,A,'r')

subplot(2,2,[3,4])
plot(X,A,'r')
hold on
plot(X, not(A),'b')