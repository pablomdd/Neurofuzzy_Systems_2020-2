function  D = Tmin(A,B)
%   Tmin (Minimum) receives sets A, B and returns the min(A,B)
% A and B must be the same length

if (length(A) == length(B))
    D = min(A,B);
else
    error('A & B are not the same length');
end

end

