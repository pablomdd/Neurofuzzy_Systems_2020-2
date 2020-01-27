function [X,Y] = GaussianFunc(start, c, sigma, finish, step)
%**************Gaussian Continous Membership Fuction*******************

%   Gaussian() returns the universe X and the Y(X) Gaussian member values
%   Receives a 'start' and a 'finish' that define de universe

% Universe declaration
X = start:step:finish;
%Y initialized
Y = zeros(1,length(X));

for i = 1:length(X)
    Y(i) = exp( (0.5) * ((X(i) - c)/sigma)^2) 
end

plot(X,Y,'.')   
end


