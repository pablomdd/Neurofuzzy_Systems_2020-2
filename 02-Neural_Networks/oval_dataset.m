function [pattern, target] =  heart_dataset(target_value)

pattern = [
    -4  0;
    -3  0;
    -2  0;
    -1  0;
    0   0;
    1   0;
    2   0;
    3   0;
    4   0;
    -3  1;
    -2  1;
    -1  1;
    0   1;
    1   1;
    2   1;  
    3   1;
    -3  2
    -2  2;
    -1  2;
    0   2;
    1   2;
    2   2;
    3   2;
    -1  3;
    0   3;
    1   3;
    -3  -1;
    -2  -1;
    -1  -1;
    0   -1;
    1   -1;
    2   -1;  
    3   -1;
    -3  -2
    -2  -2;
    -1  -2;
    0   -2;
    1   -2;
    2   -2;
    3   -2;
    -1  -3;
    0   -3;
    1   -3;

];

target = zeros(1,length(pattern));
for i = 1:length(pattern)
    target(i) = target_value;
end