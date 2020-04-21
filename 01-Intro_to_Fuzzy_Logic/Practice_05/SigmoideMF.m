function Y = SigmoideMF( a,c,start,finish, step)
%**************Sigmoide Continous Membership Fuction*******************

%   Bell() returns the universe X and the Y(X) Bell member values
%   Receives a 'start' and a 'finish' that define de universe

% Universe declaration
X = start:step:finish;
%Y initialized
Y = zeros(1,length(X));

for i = 1:length(X)
    Y(i) = 1 /(1 + exp(-a*(X(i)-c)));
end

plot(X,Y,'.')   
end
