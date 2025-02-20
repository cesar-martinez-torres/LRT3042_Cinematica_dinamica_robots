%% Ejercicio 1.2
clear
close all
WtW=transl(0,0,0)
WtA=transl(0,1,1)
AtB=transl(-1,1,0)
BtC=transl(0,0,2)*trotx(180,'deg')*trotz(-90,'deg')
WtB=WtA*AtB
WtC=WtB*BtC
% rpy
%WtCrpy=tr2rpy(WtC,'deg')
%WtCeul=tr2eul(WtC,'deg')
%Wtcrpyv=transl(-1,2,3)*trotz(WtCeul(1),'deg')*troty(WtCeul(2),'deg')*trotz(WtCeul(3),'deg')
figure
trplot(WtW,'frame','W','color','b')
hold on
trplot(WtA,'frame','A','color','k')
trplot(WtB,'frame','B','color','g')
trplot(WtC,'frame','C','color','r')
axis([-2 2 -2 2 -1 4])
view(35,38)
%% Inciso 2
% Calcular la pos de las esquinas con respecto a A
Ae1e=[0;0;0]
Ae2e=[-2;0;0]
Ae3e=[-2;2;0]
Ae4e=[0;2;0]
Ae1h=e2h(Ae1e)
Ae2h=e2h(Ae2e)
Ae3h=e2h(Ae3e)
Ae4h=e2h(Ae4e)
We1h=WtA*Ae1h
We2h=WtA*Ae2h
We3h=WtA*Ae3h
We4h=WtA*Ae4h
We1e=h2e(We1h)
We2e=h2e(We2h)
We3e=h2e(We3h)
We4e=h2e(We4h)
figure
trplot(WtW,'frame','W','color','b')
hold on
trplot(WtA,'frame','A','color','k')
trplot(WtB,'frame','B','color','g')
trplot(WtC,'frame','C','color','r')
plot_point3(We1e,'Label','E1')
plot_point3(We2e,'Label','E2')
plot_point3(We3e,'Label','E3')
plot_point3(We4e,'Label','E4')
axis([-2 2 -2 2 -1 4])
view(35,38)
%% Inciso 3
syms xs ys zs
AtBsim=transl(xs,ys,zs)
xs=-1
ys=1
zs=0
AtB=eval(AtBsim)
WtB=WtA*AtB
figure
trplot(WtW,'frame','W','color','b')
hold on
trplot(WtA,'frame','A','color','k')
trplot(WtB,'frame','B','color','r')
trplot(WtC,'frame','C','color','r')
plot_point3(We1e,'Label','E1')
plot_point3(We2e,'Label','E2')
plot_point3(We3e,'Label','E3')
plot_point3(We4e,'Label','E4')
axis([-2 2 -2 2 -1 4])
view(35,38)
%% Inciso 4
Wp1e=[0;1;0]
Wp2e=[We2e(1);We2e(2);0]
Wp3e=[We3e(1);We3e(2);0]
Wp4e=[We4e(1);We4e(2);0]
Ws1e=[We3e(1);We3e(2);We3e(3)+2]

Cs2h=[0;0;0;1]
Ws2h=WtC*Cs2h
Ws2e=h2e(Ws2h)
figure
trplot(WtW,'frame','W','color','b')
hold on
trplot(WtA,'frame','A','color','k')
trplot(WtB,'frame','B','color','r')
trplot(WtC,'frame','C','color','r')
plot_point3(We1e,'Label','E1')
plot_point3(We2e,'Label','E2')
plot_point3(We3e,'Label','E3')
plot_point3(We4e,'Label','E4')

plot_point3(Wp1e,'Label','P1')
plot_point3(Wp2e,'Label','P2')
plot_point3(Wp3e,'Label','P3')
plot_point3(Wp4e,'Label','P4')

plot_point3(Ws1e,'Label','S1')
plot_point3(Ws2e,'Label','S2')

plot3DLine(We1e,We2e)
plot3DLine(We2e,We3e)
plot3DLine(We4e,We3e)
plot3DLine(We1e,We4e)

plot3DLine(We1e,Wp1e)
plot3DLine(We2e,Wp2e)
plot3DLine(We3e,Wp3e)
plot3DLine(We4e,Wp4e)

plot3DLine(We3e,Ws1e)
plot3DLine(Ws1e,Ws2e)





axis([-2 2 -2 2 -1 4])
view(35,38)



