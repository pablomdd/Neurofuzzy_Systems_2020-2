function [pattern, target] = other_dataset(target_value)

pattern = [
    5   0;
    4.5   1.5;
    3   2.5;
    2   3;
    1   3.5;
    0   4;
    -5   0;
    -4.5   1.5;
    -3   2.5;
    -2   3;
    -1   3.5;
    4.5   -1.5;
    3   -2.5;
    2   -3;
    1   -3.5;
    0   -4;
    -5   -0;
    -4.5   -1.5;
    -3   -2.5;
    -2   -3;
    -1   -3.5;
];

target = zeros(1,length(pattern));
for i = 1:length(pattern)
    target(i) = target_value;
end