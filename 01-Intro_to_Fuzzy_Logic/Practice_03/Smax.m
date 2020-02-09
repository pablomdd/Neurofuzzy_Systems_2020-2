function D = Smax(A,B)
%Smax (Maximum) receives sets A, B and returns the 'a OR b' operation.
% A and B must be the same length

if (length(A) == length(B))
    D = max(A,B);
else
    error('A & B are not the same length');
end
end

