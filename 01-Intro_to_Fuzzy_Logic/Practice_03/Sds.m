function D = Sds(A,B)
%Sds (Drastic Sum) receives sets A, B and returns
%       a, if b=0
%       b, if a=0
%       1, if (a,b) > 0  
% A and B must be the same length

if (length(A) == length(B))
   D = zeros(1,length(A));
   for i = 1:length(A)
       if(B(i) == 0)
           D(i) = A(i);
       elseif(A(i) == 0)
           D(i) = B(i);
       elseif(A(i) && B(i) > 0)
           D(i) = 1;
       end
   end
else
    error('A & B are not the same length');
end
end