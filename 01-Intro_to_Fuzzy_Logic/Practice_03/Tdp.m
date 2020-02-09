function D = Tdp(A,B)
%Tdp (Drastic Product) receives sets A, B and returns
%       a, if b=1
%       b, if a=1
%       0, if (a,b) < 1
% A and B must be the same length

if (length(A) == length(B))
   D = zeros(1,length(A));
   for i = 1:length(A)
       if(B(i) == 1)
           D(i) = A(i);
       elseif(A(i) == 1)
           D(i) = B(i);
       else
           D(i) = 0;
       end
   end
else
    error('A & B are not the same length');
end

end