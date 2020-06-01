% P11: Autoassociative NN by Pablo Dominguez

% � Create 6 figures with 100 pixels each
% � Transform the matrices into vectors
% % � Calculate W
% % � Test the NN

% ============Initialization===========
clc, clear all, close all
% Here we call our patterns and targets available in different files
for i = 1:6
   fileName = ['pattern_' num2str(i)];
   patternStruct.(fileName) = load([fileName '.txt']);
end

P1 = matrix2vector(patternStruct.pattern_1);
P2 = matrix2vector(patternStruct.pattern_2);
P3 = matrix2vector(patternStruct.pattern_3);
P4 = matrix2vector(patternStruct.pattern_4);
P5 = matrix2vector(patternStruct.pattern_5);
P6 = matrix2vector(patternStruct.pattern_6);

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
% � Generate vector with errors
% % � 10 errors
% % � 20 errors
% % � 30 errors
% % � 40 errors
% % � 50 errors

for i = 1:5
   fileName = ['test_pattern_' num2str(i)];
   testStruct.(fileName) = load([fileName '.txt']);
end
T1 = matrix2vector(patternStruct.test_pattern_1);
T2 = matrix2vector(patternStruct.test_pattern_2);
T3 = matrix2vector(patternStruct.test_pattern_3);
T4 = matrix2vector(patternStruct.test_pattern_4);
T5 = matrix2vector(patternStruct.test_pattern_5);

%% TESTING
% ===========================================
figure(2)
% R= [E1; E2; E3; E4; E5; E6]
imshow( patternStruct.test_pattern_1 ,'InitialMagnification','fit');
hold on

a1 = hardlims(W*T1)

if a1 == P1'
    title('Pattern is a ONE')
elseif a1 == P2'
    title('Pattern is a TWO') 
elseif a1 == P3'
    title('Pattern is a THREE')
elseif a1 == P4'
    title('Pattern is a FOUR')
elseif a1 == P5'
    title('Pattern is a FIVE')
elseif a1 == P6'
    title('Pattern is a SIX')
else
    title('Pattern is Other')
end
% 
% % =======================================
% figure(3)
% R2= [E7; E8; E9; E10; E11; E12];
% imshow( R2 ,'InitialMagnification','fit');
% hold on
% 
% a2 = hardlims(W*T2);
% 
% if a2 == P1'
%     title('Pattern is a Zero')
% elseif a2 == P2'
%     title('Pattern is a ONE') 
% elseif a2 == P3'
%     title('Pattern is a TWO')
% else
%     title('Pattern is Other')
% end
% 
% figure(4)
% R3= [E13; E14; E15; E16; E17; E18];
% imshow( R3 ,'InitialMagnification','fit');
% hold on
% 
% a3 = hardlims(W*T3)
% 
% if a3 == P1'
%     title('Pattern is a Zero')
% elseif a3 == P2'
%     title('Pattern is a ONE') 
% elseif a3 == P3'
%     title('Pattern is a TWO')
% else
%     title('Pattern is Other')
% end
%     