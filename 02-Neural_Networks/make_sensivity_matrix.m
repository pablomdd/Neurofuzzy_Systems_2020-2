function [matrix] = make_sensivity_matrix(vector)

matrix = eye(length(vector));

for i = 1 : length(vector)
    matrix(i,i) = matrix(i,i) - vector(i);
    matrix(i,i) = matrix(i,i) * vector(i);
end

