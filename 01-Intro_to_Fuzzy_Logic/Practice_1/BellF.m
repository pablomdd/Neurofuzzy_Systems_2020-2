function [X,Y] = BellF(start, a,b,c, finish, step)
%**************Bell Continous Membership Fuction*******************

%   Bell() returns the universe X and the Y(X) Bell member values
%   Receives a 'start' and a 'finish' that define de universe

% Universe declaration
X = start:step:finish;
%Y initialized
Y = zeros(1,length(X));

for i = 1:length(X)
    Y(i) = 1 /(1 + (abs((X(i)- c)/a))^(2*b));
end

% plot(X,Y,'.')   
end
