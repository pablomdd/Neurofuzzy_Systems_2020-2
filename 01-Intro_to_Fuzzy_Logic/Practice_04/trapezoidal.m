function[Y] = trapezoidal(start, a, b, c, d, endlich, step)
X=start:step:endlich;
Y=zeros(1,length(X));
    for pos = 1:length(X)
        
        if start == a
        Y(1)=1;
        end
        
        if ( X(pos) <= a )
        Y(pos)=0;
       
        elseif ((a < X(pos)) && (X(pos) <= b))
        Y(pos) = (X(pos)-a)/(b-a);
        
        elseif (b < X(pos) && X(pos) <= c)
        Y(pos) = 1;
        
        elseif ((c < X(pos))  && (X(pos)<=d) )
        Y(pos)=(d-X(pos))/(d-c);
        
        elseif ( d < X(pos) )
        Y(pos)=0; 
        
        end
              
    end   

% plot(X,Y)
hold on