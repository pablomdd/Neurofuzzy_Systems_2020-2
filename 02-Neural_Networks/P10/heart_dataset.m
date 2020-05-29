function [heart_pattern, target] =  heart_dataset(target_value)

heart_pattern = [
    0   0;
    2   1;
    4   3;  
    6   5;
    7   7;
    7   9;
    6   11;
    4   12;
    2   11;
    0   10;
    -2   1;
    -4   3;  
    -6   5;
    -7   7;
    -7   9;
    -6   11;
    -4   12;
    -2   11;
    1   2;
    1   4;
    1   6;
    1   8;
    3   3;
    3   5;
    3   7;
    3   9;
    5   6;  
    5   8;
    5   10;
    -1   2;
    -1   4;
    -1   6;
    -1   8;
    -3   3;
    -3   5;
    -3   7;
    -3   9;
    -5   6;  
    -5   8;
    -5   10;
];

target = zeros(1,length(heart_pattern));
for i = 1:length(heart_pattern)
    target(i) = target_value;
end