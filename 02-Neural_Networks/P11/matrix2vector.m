function [vector] = matrix2vector(A)
% Receives a matrix A and turn it into a 1-row vector
    vector = reshape(A.',1,[]);
end

