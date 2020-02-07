function A = A_MF(start, finish, step)
    X = start:step:finish;
    A = length(X);
    
    for i=1:length(X)
        A(i) = X(i)/(X(i)+ 2);
    end
    
end

