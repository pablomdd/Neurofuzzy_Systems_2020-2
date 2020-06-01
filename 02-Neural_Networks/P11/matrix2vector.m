function [vector] = matrix2vector(A)
    reshape(A,1,[]);
    transpose(A);
    A.';
    A(:);
    vector = reshape(A.',1,[]);
end

