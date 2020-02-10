function D = Tap(A,B)
%TAP (Algebraic Product) receives sets A, B and returns the algebraic product a x b
% A and B must be the same length

if (length(A) == length(B))
   D = zeros(1,length(A))
   for i = 1:length(A)
    D(i) = A(i) * B(i)
   end
else
    error('A & B are not the same length');
end

end

