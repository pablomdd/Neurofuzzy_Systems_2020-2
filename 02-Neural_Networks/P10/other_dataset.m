function [pattern, target] = other_dataset(target_value)

pattern = [
    0   -1;
    2   0;
    3   1;
    4   2;
    5   1;
    5   3;
    6   4;
    7   4;
    7   5;
    8   5;
    8   7;
    9   8;
    8   9;
    8   11;
    7   12;
    6   13; 
    4   13;
    3   12;
    2   12;
    0   12;
    0   11;
    -2   0;
    -3   1;
    -4   2;
    -5   1;
    -5   3;
    -6   4;
    -7   4;
    -7   5;
    -8   5;
    -8   7;
    -9   8;
    -8   9;
    -8   11;
    -7   12;
    -6   13;
    -3  12;
    -4   13;
    -2   12;
];

target = zeros(1,length(pattern));
for i = 1:length(pattern)
    target(i) = target_value;
end