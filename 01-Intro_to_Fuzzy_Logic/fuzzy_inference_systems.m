%If someone is seeing this, I'm really sorry about the noodle code, I was
%un a rush. Hope to fix it soon :) Maybe collab and PR?

%FUZZY INFERENCE SYSTEMS

%UNIVERSES
X = 0:0.1:10;
Y = 0:0.1:10;
Z = 0:0.1:10;

A1 = zeros(1,length(X));
A2 = zeros(1,length(X));

B1 = zeros(1,length(X));
B2 = zeros(1,length(X));

C1 = zeros(1,length(X));
C2 = zeros(1,length(X));

%Evaluation variables
evalA = 4.5;
xA = 0;
pA2 = 0;
pA1 = 0;

evalB = 7;
xB = 0;
pB2 = 0;
pB1 = 0;

% Membership declaration
for i = 1:length(X)
    A1(i) = round(1 / (1 + exp(3*(X(i) - 5))), 2);
    A2(i) = round(1 / (1 + exp(-3*(X(i) - 5))),2);
    
    B1(i) = round(exp(-0.5*((Y(i) - 2.5) / 2 )^2),2);
    B2(i) = round(exp(-0.5*((Y(i) - 7.5) / 2 )^2),2);
    
    C1(i) = round(1 / (1 + exp(3*(Z(i) - 5))),2);
    C2(i) = round(exp(-0.5*((Y(i) - 7.5) / 2 )^2),2);
    
    if (X(i) == evalA)
        xA = X(i);
        pA1 = A1(i);
        pA2 = A2(i);  
    end
    
    if (X(i) == evalB)
        xB = X(i);
        pB1 = B1(i);
        pB2 = B2(i);
    end
end

% Loop for the Cmin values
minA1B1 = min(pA1,pB1);
minA1B2 = min(pA1,pB2);
minA2B1 = min(pA2,pB1);
minA2B2 = min(pA2,pB2);

xminA1B1 = 0;
xminA1B2 = 0;
xminA2B1 = 0;
xminA2B2 = 0;

for i = 1:length(X)
    if (C1(i) == minA1B1)
        xminA1B1 = X(i);
    end
    if (C1(i) == minA1B2)
        xminA1B2 = X(i);
    end
    if (C2(i) == minA2B1)
        xminA2B1 = X(i);
    end
    if (C2(i) == minA2B2)
        xminA2B2 = X(i);
    end
end



% -------------- Graphs----------------

figure(1)
%--A1
subplot(4,3,1)
title('A1')
hold on
plot(X,A1)
hold on
plot(xA,pA1,'*')
hold on
legend('A1')
hold off

%--B1
subplot(4,3,2)
title('B1')
hold on
plot(X,B1)
hold on
plot(xB,pB1,'*')
hold on
legend('B1')
hold off

%--C1 = min(A1, B1)
subplot(4,3,3)
title('C1=min(A1,B1)')
hold on
plot(X,C1)
hold on

plot(xminA1B1,minA1B1,'*')
hold on
legend('minA1B1')
hold off


%--A1
subplot(4,3,4)
title('A1')
hold on
plot(X,A1)
hold on
plot(xA,pA1,'*')
hold on
legend('A1')
hold off

%--B2
subplot(4,3,5)
title('B2')
hold on
plot(X,B2)
hold on
plot(xB,pB2,'*')
hold on
legend('B2')
hold off

%--C1 = min(A1, B2)
subplot(4,3,6)
title('C1=min(A1,B2)')
hold on
plot(X,C1)
hold on

plot(xminA1B2,minA1B2,'*')
hold on
legend('minA1B2')
hold off



%--A2
subplot(4,3,7)
title('A2')
hold on
plot(X,A2)
hold on
plot(xA,pA2,'*')
hold on
legend('A2')
hold off

%--B1
subplot(4,3,8)
title('B1')
hold on
plot(X,B1)
hold on
plot(xB,pB1,'*')
hold on
legend('B1')
hold off

%--C2 = min(A1, B1)
subplot(4,3,9)
title('C2=min(A2,B1)')
hold on
plot(X,C2)
hold on

plot(xminA2B1,minA2B1,'*')
hold on
legend('minA2B1')
hold off


%--A2
subplot(4,3,10)
title('A2')
hold on
plot(X,A2)
hold on
plot(xA,pA2,'*')
hold on
legend('A2')
hold off

%--B2
subplot(4,3,11)
title('B2')
hold on
plot(X,B2)
hold on
plot(xB,pB2,'*')
hold on
legend('B2')
hold off

%--C2 = min(A2, B2)
subplot(4,3,12)
title('C2=min(A2,B2)')
hold on
plot(X,C2)
hold on

plot(xminA2B2,minA2B2,'*')
hold on
legend('minA2B2')
hold off

%-------3. Calcute the max for each output C1, C2

maxC1 = max(minA1B1,minA1B2);
maxC2 = max(minA2B1,minA2B2);

xmaxC1 = 0;
xmaxC2 = 0;


for i = 1:length(X)
    if (C1(i) == maxC1)
        xmaxC1 = X(i);
    end
     if (C2(i) == maxC2)
        xmaxC2 = X(i);
     end
end

figure(2)
subplot(2,1,1)
title('maxC1=max(minA1B1,minA1B2)')
hold on
plot(X,C1)
hold on

plot(xmaxC1,maxC1,'*')
hold off

subplot(2,1,2)
title('maxC2=max(minA2B1,minA2B2)')
hold on
plot(X,C2)
hold on

plot(xmaxC2,maxC2,'*')
hold off


% ----------4. max-min composition to find outlines
% cutline1 = ones(size(X)) * maxC1;
% cutline2 = ones(size(X)) * maxC2;

cutline1 = min(maxC1,C1);
cutline2 = min(maxC2,C2);

finalcut = zeros(length(Z));

finalcut = max(cutline1, cutline2);
defuzz(Z, finalcut, 'centroid')

figure(3)
title('max(outlineC1,outlineC2)')
hold on
plot(X,C1)
hold on
plot(X,C2)
hold on
plot(X, finalcut,'Linewidth',3)
hold on
legend("C1","C2","max(cutline1, cutline2)")
% plot(X, cutline2, 'Linewidth',3)
% hold on
% cutlineM = (maxC2 - maxC1) / (xmaxC2 - xmaxC1)
% plot([xmaxC1 xmaxC2],[maxC1 maxC2],'Linewidth',3)



