% P11: Autoassociative NN by Pablo Dominguez

% • Create 6 figures with 100 pixels each
% • Transform the matrices into vectors
% % • Calculate W
% % • Test the NN

% ============Initialization===========
clc, clear all, close all
% Here we call our patterns available in different files
for i = 1:6
   fileName = ['pattern_' num2str(i)];
   patternStruct.(fileName) = load([fileName '.txt']);
end

% Pattern asignation from Struct to Workspace Variable
% As it is read as a Matrix, we parse it as a vector with matrix2vector()
P1 = matrix2vector(patternStruct.pattern_1);
P2 = matrix2vector(patternStruct.pattern_2);
P3 = matrix2vector(patternStruct.pattern_3);
P4 = matrix2vector(patternStruct.pattern_4);
P5 = matrix2vector(patternStruct.pattern_5);
P6 = matrix2vector(patternStruct.pattern_6);

patternCell = struct2cell(patternStruct);

for i = 1:6
    subplot(2,3,i)
    imshow(patternCell{i} ,'InitialMagnification','fit');
    hold on
    
    s = strcat('Pattern: ', num2str(i));
    title(s);
    hold on
end

P = [P1; P2; P3; P4; P5; P6]';
t = P;
%%
% figure(1)
% I = [patternStruct.pattern_1];
% imshow(I,'InitialMagnification','fit');

%% Training
W = t * pinv(P); 

%% TESTING config
% Test the NN
% • Generate vector with errors
% % • 10 errors
% % • 20 errors
% % • 30 errors
% % • 40 errors
% % • 50 errors

% File reading for test patterns
for i = 1:5
   fileName = ['test_pattern_' num2str(i)];
   testStruct.(fileName) = load([fileName '.txt']);
end
% Test patterns asignation to a Workspace variable
T1 = matrix2vector(testStruct.test_pattern_1);
T2 = matrix2vector(testStruct.test_pattern_2);
T3 = matrix2vector(testStruct.test_pattern_3);
T4 = matrix2vector(testStruct.test_pattern_4);
T5 = matrix2vector(testStruct.test_pattern_5);

% Testing Array for looping
T = [T1; T2 ; T3 ; T4; T5];
% Testing Cell for graphs
testCell = struct2cell(testStruct);

%% TESTING
% Figure will show a 2x3 plot with the testing for each Test Pattern
figure(2)
for i = 1:5
    subplot(2,3,i)
    imshow(testCell{i} ,'InitialMagnification','fit');
    hold on
    
%   Testing 
    a = hardlims(W * T(i,:)');

    if a == P1'
        title('Pattern is ONE')
    elseif a == P2'
        title('Pattern is TWO') 
    elseif a == P3'
        title('Pattern is THREE')
    elseif a == P4'
        title('Pattern is FOUR')
    elseif a == P5'
        title('Pattern is FIVE')
    elseif a == P6'
        title('Pattern is SIX')
    else
        title('Pattern is Other')
    end
    hold on
end