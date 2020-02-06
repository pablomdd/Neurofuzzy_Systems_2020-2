function B = B_MF(start, finish, step)
    X = start:step:finish;
    B = length(X);
    
    for i=1:length(X)
        B(i) = 2^(-X(i));
    end
    
end