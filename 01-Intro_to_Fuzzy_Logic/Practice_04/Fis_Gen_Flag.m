X1 = 0:1:359;
X2 = -2.5:0.25:7.25;
X3 = 0:1:100;

ENg = trapezoidal(0,0,0,10,80,359,1);
Ng = trapezoidal(0,10,80,100,170,359,1);
Wg = trapezoidal(0,100,170,190,260,359,1);
Sg = trapezoidal(0,190,260,280,350,359,1);
ESg = trapezoidal(0,280,350,359,359,359,1);

ENf = trapezoidal(0,0,0,10,80,359,1);
Nf = trapezoidal(0,10,80,100,170,359,1);
Wf = trapezoidal(0,100,170,190,260,359,1);
Sf = trapezoidal(0,190,260,280,350,359,1);
ESf = trapezoidal(0,280,350,359,359,359,1);

Low = trapezoidal(0,0,0,10,35,100,1);
Med = trapezoidal(0,15,40,60,85,100,1);
High = trapezoidal(0,65,90,100,100,100,1);

CW = trapezoidal(-2.5,-2.25, -0.25, 0.25, 2.25,7.25,0.25);
DM = trapezoidal(-2.5,0.25,2.25,2.75,4.75,7.25,0.25);
ACW = trapezoidal(-2.5,2.75, 4.75, 5.25, 7.25,7.25,0.25);


Flag = input('Enter flag position (0-359): ');
Gen = input('Enter generator position(0-359): ');

%Minimos de ENg con las posiciones de la bandera 

min1 = min(ENg(Gen),ENf(Flag)); %low,dm
min2 = min(ENg(Gen),Nf(Flag));%med,acw
min3 = min(ENg(Gen),Wf(Flag));%high,cw
min4 = min(ENg(Gen),Sf(Flag));%med,cw
min5 = min(ENg(Gen),ESf(Flag));%low,cw

%Minimos de Ng con las posiciones de la bandera

min6 = min(Ng(Gen),ENf(Flag)); %low,cw
min7 = min(Ng(Gen),Nf(Flag)); %low,dm
min8 = min(Ng(Gen),Wf(Flag)); %low,acw
min9 = min(Ng(Gen),Sf(Flag));%high,cw
min10 = min(Ng(Gen),ESf(Flag));%med,cw

%Minimos de Wg con las posiciones de la bandera

min11 = min(Wg(Gen),ENf(Flag));%high,acw
min12 = min(Wg(Gen),Nf(Flag));%low,cw
min13 = min(Wg(Gen),Wf(Flag));%low,dm
min14 = min(Wg(Gen),Sf(Flag));%med,acw
min15 = min(Wg(Gen),ESf(Flag));%high,acw

%Minimos de Sg con las posiciones de la bandera

min16 = min(Sg(Gen),ENf(Flag));%low,acw
min17 = min(Sg(Gen),Nf(Flag));%high,cw
min18 = min(Sg(Gen),Wf(Flag));%med,cw
min19 = min(Sg(Gen),Sf(Flag));%low,dm
min20 = min(Sg(Gen),ESf(Flag));%low,acw


%Minimos de ESg con las posiciones de la bandera

min21 = min(ESg(Gen),ENf(Flag));%low,acw
min22 = min(ESg(Gen),Nf(Flag));%med,acw
min23 = min(ESg(Gen),Wf(Flag));%high,cw
min24 = min(ESg(Gen),Sf(Flag));%med,cw
min25 = min(ESg(Gen),ESf(Flag));%low,dm

%Para la velocidad
V1 = [min1,min5,min6,min7,min8,min12,min13,min16,min19,min20,min21,min25];
maxlow = max(V1);

V2 = [min2,min4,min10,min14,min18,min22,min24];
maxmed = max(V2);

V3 = [min3,min9,min11,min15,min17,min23];
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
speed = defuzz(X3,finalcutlinespeed, 'centroid')
h1 = line([speed speed],[0 1],'Color','k');
t1 = text(speed,0.1,' centroid');
hold on
plot(X3,finalcutlinespeed,'*',X3,Low,'g',X3,Med,'y',X3,High,'r')
legend({'Centroid','Finalcut Speed','Low','Med','High'},'Location','northeast')

%Para la rotacion
R1 = [min1, min7, min13, min19, min25];
maxDM = max(R1);
R2 = [min2, min8, min11, min14, min15, min16, min20, min21, min22];
maxACW = max(R2);
R3 = [min3, min4, min5, min6, min9, min10, min12, min17, min18, min23, min24];
maxCW = max(R3);

cutlineDM = min(maxDM, DM);
cutlineACW = min(maxACW, ACW);
cutlineCW = min(maxCW, CW);

maxcc1 = max(cutlineDM, cutlineACW);
maxcc2 = max(cutlineDM, cutlineCW);
maxcc3 = max(cutlineACW, cutlineCW);

maxb = max(maxcc1, maxcc2);

finalcutlinerotation = max(maxb,maxcc3);

subplot(1,2,2)
rotation = defuzz(X2, finalcutlinerotation, 'centroid')
h2 = line([rotation rotation],[0 1],'Color','k');
t2 = text(rotation,0.1,' centroid');
hold on
plot(X2,finalcutlinerotation, '*', X2, CW, 'g', X2, DM, 'y', X2, ACW,'r','Linewidth', 1)
legend({'Centroid','Finalcut Rotation','CW','DM','ACW'},'Location','northeast')



%   ----------------------Parte 2 ----------------------
A=zeros(length(X1),length(X1));
B=zeros(360,360);

for f = 1:1:360
      for g = 1:1:360
    %Minimos de ENg con las posiciones de la bandera 

        Min1 = min(ENg(g),ENf(f)); %low,dm
        Min2 = min(ENg(g),Nf(f));%med,acw
        Min3 = min(ENg(g),Wf(f));%high,cw
        Min4 = min(ENg(g),Sf(f));%med,cw
        Min5 = min(ENg(g),ESf(f));%low,cw

        %Minimos de Ng con las posiciones de la bandera

        Min6 = min(Ng(g),ENf(f)); %low,cw
        Min7 = min(Ng(g),Nf(f)); %low,dm
        Min8 = min(Ng(g),Wf(f)); %low,acw
        Min9 = min(Ng(g),Sf(f));%high,cw
        Min10 = min(Ng(g),ESf(f));%med,cw

        %Minimos de Wg con las posiciones de la bandera

        Min11 = min(Wg(g),ENf(f));%high,acw
        Min12 = min(Wg(g),Nf(f));%low,cw
        Min13 = min(Wg(g),Wf(f));%low,dm
        Min14 = min(Wg(g),Sf(f));%med,acw
        Min15 = min(Wg(g),ESf(f));%high,acw

        %Minimos de Sg con las posiciones de la bandera

        Min16 = min(Sg(g),ENf(f));%low,acw
        Min17 = min(Sg(g),Nf(f));%high,cw
        Min18 = min(Sg(g),Wf(f));%med,cw
        Min19 = min(Sg(g),Sf(f));%low,dm
        Min20 = min(Sg(g),ESf(f));%low,acw

        %Minimos de ESg con las posiciones de la bandera

        Min21 = min(ESg(g),ENf(f));%low,acw
        Min22 = min(ESg(g),Nf(f));%med,acw
        Min23 = min(ESg(g),Wf(f));%high,cw
        Min24 = min(ESg(g),Sf(f));%med,cw
        Min25 = min(ESg(g),ESf(f));%low,dm

        %Para la velocidad
        v1 = [Min1,Min5,Min6,Min7,Min8,Min12,Min13,Min16,Min19,Min20,Min21,Min25];
        Maxlow = max(v1);
        v2 = [Min2,Min4,Min10,Min14,Min18,Min22,Min24];
        Maxmed = max(v2);
        v3 = [Min3,Min9,Min11,Min15,Min17,Min23];
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
        r1 = [Min1,Min7,Min13,Min19,Min25];
        MaxDM = max(r1);
        r2 = [Min2,Min8,Min11,Min14,Min15,Min16,Min20,Min21,Min22];
        MaxACW = max(r2);
        r3 = [Min3,Min4,Min5,Min6,Min9,Min10,Min12,Min17,Min18,Min23,Min24];
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

figure(2)
[xx,yy] = meshgrid(ejex,ejey);
surf(ejex,ejey,A)
title('Speed')

figure(3)
surf(ejex,ejey,B)
title('Rotation')
