function C = C_MF(start, finish, step)
    X = start:step:finish;
    C = length(X);
    
    for i=1:length(X)
        C(i) = 1 / (1 + 10*((((X(i)-2)^2))));
    end
    
end