% Autoassociative NN Exercise

% • Design an autoassociative NN able to recognize the numbers 0,
% 1 and 2
% • Create the numbers 0, 1 and 2 in a 30 pixels matrix

%ZERO Pattern
F1 = [1 1 1 1 1];
F2 = [1 -1 -1 -1 1];
F3 = [1 -1 -1 -1 1];
F4 = [1 -1 -1 -1 1];
F5 = [1 -1 -1 -1 1];
F6 = [1 1 1 1 1];
P1 = [F1 F2 F3 F4 F5 F6];

%ONE Pattern
F7 = [-1 -1 1 -1 -1];
F8 = [-1 1 1 -1 -1];
F9 = [-1 -1 1 -1 -1];
F10 = [-1 -1 1 -1 -1];
F11 = [-1 -1 1 -1 -1];
F12 = [-1 -1 1 -1 -1];
P2 = [F7 F8 F9 F10 F11 F12];

% TWO Pattern
F14 = [-1 1 1 1 -1];
F15 = [-1 -1 -1 1 -1];
F16 = [-1 -1 -1 1 -1];
F17 = [-1 1 1 1 -1];
F18 = [-1 1 -1 -1 -1];
F19 = [-1 1 1 1 -1];
P3 = [F14 F15 F16 F17 F18 F19];

P = [P1; P2; P3]';
t = P;

% Show image
figure(1)
I = [F1 F7 F14; F2 F8 F15; F3 F9 F16; ...
     F4 F10 F17; F5 F11 F18; F6 F12 F19];
imshow(I,'InitialMagnification','fit');
%% Training
W = t * pinv(P); 

%% TESTING config
% Prepare vectors that contain errors
% • 5 errors
% • 10 errors
% • 15 errors

% Zero with 5 Errors
E1 = [1 1 1 -1 -1];
E2 = [1 -1 1 -1 1];
E3 = [1 -1 -1 1 1];
E4 = [1 -1 -1 1 1];
E5 = [1 1 -1 -1 1];
E6 = [1 1 1 -1 1];
T1 = [E1 E2 E3 E4 E5 E6]';

% One with 10 Errors
E7 = [-1 -1 1 -1 1];
E8 = [-1 1 1 -1 -1];
E9 = [-1 1 -1 1 -1];
E10 = [-1 1 -1 1 -1];
E11 = [1 -1 -1 1 1];
E12 = [1 -1 -1 1 1];
T2 = [E7 E8 E9 E10 E11 E12]';

%Two with 15 Errors
E13 = [1 -1 -1 1 1];
E14 = [1 1 1 1 1];
E15 = [-1 1 1 1 1];
E16 = [1 -1 -1 1 -1];
E17 = [-1 1 1 1 1];
E18 = [1 1 -1 1 -1];
T3 = [E13 E14 E15 E16 E17 E18]';

%% TESTING
% ===========================================
figure(2)
R= [E1; E2; E3; E4; E5; E6]
imshow( R ,'InitialMagnification','fit');
hold on

a1 = hardlims(W*T1)

if a1 == P1'
    title('Pattern is a Zero')
elseif a1 == P2'
    title('Pattern is a ONE') 
elseif a1 == P3'
    title('Pattern is a TWO')
else
    title('Pattern is Other')
end

% =======================================
figure(3)
R2= [E7; E8; E9; E10; E11; E12];
imshow( R2 ,'InitialMagnification','fit');
hold on

a2 = hardlims(W*T2);

if a2 == P1'
    title('Pattern is a Zero')
elseif a2 == P2'
    title('Pattern is a ONE') 
elseif a2 == P3'
    title('Pattern is a TWO')
else
    title('Pattern is Other')
end

figure(4)
R3= [E13; E14; E15; E16; E17; E18];
imshow( R3 ,'InitialMagnification','fit');
hold on

a3 = hardlims(W*T3)

if a3 == P1'
    title('Pattern is a Zero')
elseif a3 == P2'
    title('Pattern is a ONE') 
elseif a3 == P3'
    title('Pattern is a TWO')
else
    title('Pattern is Other')
end
    
