%% Ejercicio 1.2
clear
close all
W=transl(0,0,0)
cTb=transl(0,0,2)*troty(-180,'deg')*trotz(90,'deg')
wTb=transl(-1,2,1)
% Puntos de las esquinas de la mesa
wp1=[0;1;1]
wp2=[0;3;1]
wp3=[-2;3;1]
wp4=[-2;1;1]
figure
plot_point3(wp1)
hold on
plot_point3(wp2)
plot_point3(wp3)
plot_point3(wp4)
plot3DLine(wp1,wp2)
trplot(W,'frame','W','arrow')
%% 2)
syms aTw wTc aTb
aTb=aTw*wTc*cTb% Matlab trata a aTw y wTc como escalares