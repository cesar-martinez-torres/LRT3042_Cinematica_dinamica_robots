%% Ejercicio 1.1
clear all
close all
W=trot2(0)
wTc=transl2(8,2)
% Para graficar los puntos deben pertenecer al eje W (Matlab) y ser
% euclidianos
wmi=[4;6]
wmd=[12;6]
wac=[6;7]
wacp=[10;7]
wrd=[12;9]
wtt=[12;3]
figure
trplot2(W, 'frame', 'W','arrow')
hold on
trplot2(wTc, 'frame', 'C','arrow')
plot_point(wmi, '*');
plot_point(wmd, '*');
plot_point(wac, '*');
plot_point(wacp, '*');
plot_point(wrd, '*');
plot_point(wtt, '*');
grid on
%% Calcular la posicion de los puntos con respecto a wTc.
wmih=e2h(wmi) % Para calculo, siempre en homogeneo
wmdh=e2h(wmd)
wach=e2h(wac)
wacph=e2h(wacp)
wrdh=e2h(wrd)
wtth=e2h(wtt)
cTw=inv(wTc)
cmih=cTw*wmih
cmdh = cTw * wmdh
cach = cTw * wach
cacph = cTw * wacph
crdh = cTw * wrdh
ctth = cTw * wtth
%% Punto ii
wTc2=transl2(11,5)*trot2(45,'deg')
wmih2=wTc2*cmih
wmdh2=wTc2*cmdh
wach2=wTc2*cach
wacph2=wTc2*cacph
wrdh2=wTc2*crdh
wtth2=wTc2*ctth
% Para graficar, los puntos deben estar en euclidiano.
wmie2=h2e(wmih2)
wmde2=h2e(wmdh2)
wace2=h2e(wach2)
wacpe2=h2e(wacph2)
wrde2=h2e(wrdh2)
wtte2=h2e(wtth2)
% Graficar los puntos transformados en el nuevo sistema de coordenadas
figure
trplot2(wTc2, 'frame', 'C2','arrow')
hold on
trplot2(W, 'frame', 'W','arrow')
plot_point(wmie2, 'o');
plot_point(wmde2, 'o');
plot_point(wace2, 'o');
plot_point(wacpe2, 'o');
plot_point(wrde2, 'o');
plot_point(wtte2, 'o');
grid on


