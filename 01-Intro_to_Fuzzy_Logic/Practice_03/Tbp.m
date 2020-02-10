function D = Tbp(A,B)
%   Tbp (Bound product) receives sets A, B and returns the '0 OR (a + b - 1)' operation
% A and B must be the same length

if (length(A) == length(B))
   D = zeros(1,length(A));
   for i = 1:length(A)
    D(i) = max(0,(A(i)+B(i))-1);
   end
else
    error('A & B are not the same length');
end

end

