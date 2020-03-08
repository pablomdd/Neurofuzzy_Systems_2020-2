%Practice 4
%-----------PART 1----------
%   Generate the code such that you ask the user to introduce
%   values for flag and generator position. Display the final
%   cutline for speed, final cutline for position and 
%   defuzzyfied value.

% We define the universes 
X1 = 0:2:359;
X2 = -2.25:0.25:7.25;
X3 = 0:1:100;

% Define the membership function for the generator
ENgen = TrapezoidalMF(0,0,10,35,0,359,2);
Ngen = TrapezoidalMF(10,80,100,170,0,359,2);
Wgen = TrapezoidalMF(100,170,190,260,0,359,2);
Sgen = TrapezoidalMF(190,260,280,350,0,359,2);
ESgen = TrapezoidalMF(280,350,359,359,0,359,2);

% Define the membership function for the flag
ENflag = TrapezoidalMF(0,0,10,35,0,359,2);
Nflag = TrapezoidalMF(10,80,100,170,0,359,2);
Wflag = TrapezoidalMF(100,170,190,260,0,359,2);
Sflag = TrapezoidalMF(190,260,280,350,0,359,2);
ESflag = TrapezoidalMF(280,350,359,359,0,359,2);

% Define the membership function for the speed
Low = TrapezoidalMF(0,0,10,35,0,100,1);
Med = TrapezoidalMF(15,40,60,85,0,100,1);
High = TrapezoidalMF(65,90,100,100,0,100,1);

%   Define the membership function for the direction
CW = TrapezoidalMF(-2.25, -0.25, 0.25, 2.25,-2.25,7.25,0.25);
DM = TrapezoidalMF(0.25,2.25,2.75,4.75,-2.25,7.25,0.25);
ACW = TrapezoidalMF(2.75, 4.75, 5.25, 7.25,-2.25,7.25,0.25);


Flag = input('Enter flag position (0-359): ');
Gen = input('Enter generator position(0-359): ');

%Minimos de ENgen con las posiciones de la bandera 

GenMin1 = min(ENgen(Gen), ENflag(Flag)); %low,dm
GenMin2 = min(ENgen(Gen), Nflag(Flag));%med,acw
GenMin3 = min(ENgen(Gen), Wflag(Flag));%high,cw
GenMin4 = min(ENgen(Gen), Sflag(Flag));%med,cw
GenMin5 = min(ENgen(Gen), ESflag(Flag));%low,cw

%Minimos de Ngen con las posiciones de la bandera

GenMin6 = min(Ngen(Gen), ENflag(Flag)); %low,cw
GenMin7 = min(Ngen(Gen), Nflag(Flag)); %low,dm
GenMin8 = min(Ngen(Gen), Wflag(Flag)); %low,acw
GenMin9 = min(Ngen(Gen), Sflag(Flag));%high,cw
GenMin10 = min(Ngen(Gen), ESflag(Flag));%med,cw

%Minimos de Wgen con las posiciones de la bandera

GenMin11 = min(Wgen(Gen), ENflag(Flag));%high,acw
GenMin12 = min(Wgen(Gen), Nflag(Flag));%low,cw
GenMin13 = min(Wgen(Gen), Wflag(Flag));%low,dm
GenMin14 = min(Wgen(Gen), Sflag(Flag));%med,acw
GenMin15 = min(Wgen(Gen), ESflag(Flag));%high,acw

%Minimos de Sgen con las posiciones de la bandera

GenMin16 = min(Sgen(Gen), ENflag(Flag));%low,acw
GenMin17 = min(Sgen(Gen), Nflag(Flag));%high,cw
GenMin18 = min(Sgen(Gen), Wflag(Flag));%med,cw
GenMin19 = min(Sgen(Gen), Sflag(Flag));%low,dm
GenMin20 = min(Sgen(Gen), ESflag(Flag));%low,acw


%Minimos de ESgen con las posiciones de la bandera

GenMin21 = min(ESgen(Gen), ENflag(Flag));%low,acw
GenMin22 = min(ESgen(Gen), Nflag(Flag));%med,acw
GenMin23 = min(ESgen(Gen), Wflag(Flag));%high,cw
GenMin24 = min(ESgen(Gen), Sflag(Flag));%med,cw
GenMin25 = min(ESgen(Gen), ESflag(Flag));%low,dm

%Para la velocidad
V1 = [GenMin1,GenMin5,GenMin6,GenMin7,GenMin8,GenMin12,GenMin13,GenMin16,GenMin19,GenMin20,GenMin21,GenMin25];
maxlow = max(V1);
V2 = [GenMin2,GenMin4,GenMin10,GenMin14,GenMin18,GenMin22,GenMin24];
maxmed = max(V2);
V3 = [GenMin3,GenMin9,GenMin11,GenMin15,GenMin17,GenMin23];
maxhigh = max(V3);

cutlinelow = min(maxlow,Low);
cutlinemed = min(maxmed,Med);
cutlinehigh = min(maxhigh,High);

maxc1 = max(cutlinelow, cutlinemed);
maxc2 = max(cutlinelow, cutlinehigh);
maxc3 = max(cutlinemed, cutlinehigh);

maxa = max(maxc1, maxc2);
finalcutlinespeed = max(maxa, maxc3);

figure(1)
subplot(1,2,1)
speed = defuzz(X3,finalcutlinespeed, 'centroid');
h1 = line([speed speed],[0 1],'Color','k');
t1 = text(speed,0.1,' centroid','FontWeight','bold');
hold on
plot(X3,finalcutlinespeed,'*',X3,Low,'g',X3,Med,'y',X3,High,'r','Linewidth',1.5)
legend({'Centroid','Finalcut Speed','Low','Med','High'},'Location','northeast')

%Para la rotacion
R1 = [GenMin1,GenMin7,GenMin13,GenMin19,GenMin25];
maxDM = max(R1);
R2 = [GenMin2,GenMin8,GenMin11,GenMin14,GenMin15,GenMin16,GenMin20,GenMin21,GenMin22];
maxACW = max(R2);
R3 = [GenMin3,GenMin4,GenMin5,GenMin6,GenMin9,GenMin10,GenMin12,GenMin17,GenMin18,GenMin23,GenMin24];
maxCW = max(R3);

cutlineDM = min(maxDM, DM );
cutlineACW = min(maxACW,ACW);
cutlineCW = min(maxCW,CW);

maxcc1 = max(cutlineDM, cutlineACW);
maxcc2 = max(cutlineDM, cutlineCW);
maxcc3 = max(cutlineACW, cutlineCW);

maxb = max(maxcc1, maxcc2);

finalcutlinerotation = max(maxb,maxcc3);

subplot(1,2,2)
rotation = defuzz(X2,finalcutlinerotation, 'centroid');
h2 = line([rotation rotation],[0 1],'Color','k');
t2 = text(rotation,0.1,' centroid','FontWeight','bold');
hold on
plot(X2,finalcutlinerotation,'*',X2,CW,'g',X2,DM,'y',X2,ACW,'r','Linewidth',1.5)
legend({'Centroid','Finalcut Rotation','CW','DM','ACW'},'Location','northeast')

A = zeros(length(X1),length(X1));
B = zeros(360,360);
% C=zeros(360);

    for f = 1:1:360
      for g = 1:1:360
        %Minimos de ENg con las posiciones de la bandera 

FlagMin1 = min(ENgen(g), ENflag(f)); %low,dm
FlagMin2 = min(ENgen(g), Nflag(f));%med,acw
FlagMin3 = min(ENgen(g), Wflag(f));%high,cw
FlagMin4 = min(ENgen(g), Sflag(f));%med,cw
FlagMin5 = min(ENgen(g), ESflag(f));%low,cw

%Minimos de Ng con las posiciones de la bandera

FlagMin6 = min(Ngen(g), ENflag(f)); %low,cw
FlagMin7 = min(Ngen(g), Nflag(f)); %low,dm
FlagMin8 = min(Ngen(g), Wflag(f)); %low,acw
FlagMin9 = min(Ngen(g), Sflag(f));%high,cw
FlagMin10 = min(Ngen(g), ESflag(f));%med,cw

%Minimos de Wg con las posiciones de la bandera

FlagMin11 = min(Wgen(g), ENflag(f));%high,acw
FlagMin12 = min(Wgen(g), Nflag(f));%low,cw
FlagMin13 = min(Wgen(g), Wflag(f));%low,dm
FlagMin14 = min(Wgen(g), Sflag(f));%med,acw
FlagMin15 = min(Wgen(g), ESflag(f));%high,acw

%Minimos de Sg con las posiciones de la bandera

FlagMin16 = min(Sgen(g), ENflag(f));%low,acw
FlagMin17 = min(Sgen(g), Nflag(f));%high,cw
FlagMin18 = min(Sgen(g), Wflag(f));%med,cw
FlagMin19 = min(Sgen(g), Sflag(f));%low,dm
FlagMin20 = min(Sgen(g), ESflag(f));%low,acw

%Minimos de ESg con las posiciones de la bandera

FlagMin21 = min(ESgen(g), ENflag(f));%low,acw
FlagMin22 = min(ESgen(g), Nflag(f));%med,acw
FlagMin23 = min(ESgen(g), Wflag(f));%high,cw
FlagMin24 = min(ESgen(g), Sflag(f));%med,cw
FlagMin25 = min(ESgen(g), ESflag(f));%low,dm

%Para la velocidad
v1 = [FlagMin1,FlagMin5,FlagMin6,FlagMin7,FlagMin8,FlagMin12,FlagMin13,FlagMin16,FlagMin19,FlagMin20,FlagMin21,FlagMin25];
Maxlow = max(v1);
v2 = [FlagMin2,FlagMin4,FlagMin10,FlagMin14,FlagMin18,FlagMin22,FlagMin24];
Maxmed = max(v2);
v3 = [FlagMin3,FlagMin9,FlagMin11,FlagMin15,FlagMin17,FlagMin23];
Maxhigh = max(v3);

Cutlinelow = min(Maxlow,Low);
Cutlinemed = min(Maxmed,Med);
Cutlinehigh = min(Maxhigh,High);

Maxc1 = max(Cutlinelow, Cutlinemed);
Maxc2 = max(Cutlinelow, Cutlinehigh);
Maxc3 = max(Cutlinemed, Cutlinehigh);

Maxa = max(Maxc1, Maxc2);
Finalcutlinespeed = max(Maxa, Maxc3);

Speed = defuzz(X3,Finalcutlinespeed, 'centroid');


%Para la rotacion
r1 = [FlagMin1,FlagMin7,FlagMin13,FlagMin19,FlagMin25];
MaxDM = max(r1);
r2 = [FlagMin2,FlagMin8,FlagMin11,FlagMin14,FlagMin15,FlagMin16,FlagMin20,FlagMin21,FlagMin22];
MaxACW = max(r2);
r3 = [FlagMin3,FlagMin4,FlagMin5,FlagMin6,FlagMin9,FlagMin10,FlagMin12,FlagMin17,FlagMin18,FlagMin23,FlagMin24];
MaxCW = max(r3);

CutlineDM = min(MaxDM, DM );
CutlineACW = min(MaxACW,ACW);
CutlineCW = min(MaxCW,CW);

Maxcc1 = max(CutlineDM, CutlineACW);
Maxcc2 = max(CutlineDM, CutlineCW);
Maxcc3 = max(CutlineACW, CutlineCW);

Maxb = max(maxcc1, maxcc2);

Finalcutlinerotation = max(Maxb,Maxcc3);

Rotation = defuzz(X2,Finalcutlinerotation, 'centroid');

A(g,f) = Speed;
B(f,g) = Rotation;           
        end
    end

ejex = [0:1:359];
ejey = [0:1:359];
[xx,yy] = meshgrid(ejex,ejey);
figure(2)
surf(ejex,ejey,A)
title('Speed')
figure(3)
surf(ejex,ejey,B)
title('Rotation')


%-----------PART 2----------
%   Generate the code to display the 3D plots f5or the behaviour
%   of speed and position for all the possible combinations of 
%   flag and generator position(step: 2 degrees)






