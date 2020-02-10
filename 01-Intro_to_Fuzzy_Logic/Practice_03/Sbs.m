function D = Sbs(A,B)
%Sbs (Bound Sum) receives sets A, B and returns the '1 AND (a + b)' operation.
% A and B must be the same length

if (length(A) == length(B)) 
    D = min(1,(A + B)); 
else
    error('A & B are not the same length');
end
end