function [X,Y] = Triangular(start, a, b, c, finish, step)
%*****************TRIANGULAR Membership Fuction***************************

%   Triangular() returns the universe X and the Y(X) triangular member values
%   Receives a 'start' and a 'finish' that define de universe
%   Values a,b,c make intervals: [start,a],(a,b],(b,c],(c,finish]

%   Be aware that a < b < c and they should be multiple of the 'step' value

% Universe declaration
X = start:step:finish;
%Y initialized
Y = zeros(1,length(X));

for i = 1:length(X)
    %Interval: 0,x <= a
    if (X(i) <= a)
		Y(i) = 0;
        
    %Interval: x-a/b-a,a < x <= b
    elseif((X(i) > a) && (X(i) <= b))
		Y(i) = (X(i)- a)/( b - a); 
        
    %Interval: c-x/c-b,b < x <= c
    elseif((X(i) > b) && (X(i) <= c))
		Y(i) = (c - X(i))/(c - b); 
    %Interval: 0,c < x
    else
		Y(i) = 0;
	end
end
% plot(X,Y)
end

