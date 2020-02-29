function [X,Y] = TrapezoidalMF( a, b, c, d, start, finish, step)
%**************TRAPEZOIDAL Discrete Membership Fuction*******************

%   Trapezoidal() returns the universe X and the Y(X) Trapezoidal member values
%   Receives a 'start' and a 'finish' that define de universe
%   Values a,b,c,d make intervals: [start,a],(a,b],(b,c],(c,d],(d,finish]

%   Be aware that a < b < c < d and they should be multiple of the 'step' value

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
    
    %Interval: 1, c < x <= d
    elseif((X(i) > b) && (X(i) <= c))
		Y(i) = 1; 
        
    %Interval: d-x/d-c, c < x <= d
    elseif((X(i) > c) && (X(i) <= d))
		Y(i) = (d - X(i))/(d - c); 
    %Interval: 0, x > d
    else
		Y(i) = 0;
	end
end

% plot(X,Y,'.')
end


