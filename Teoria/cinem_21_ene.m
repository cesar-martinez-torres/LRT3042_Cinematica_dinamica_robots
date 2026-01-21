%% Probando comandos de Toolbox 
clear all
close all
A=transl2(4,5)
B=rot2(1.2)%radianes
g=rad2deg(1.2)
B1=rot2(g,'deg')%grados
C=trot2(g,'deg')%grados
% Si necesito T => R
D=SE2(B,[2 3])
% Para dibujar ejes de referencia, debo tenerlo ref a W
figure
trplot2(A, 'frame', 'A','arrow')
hold on
trplot2(C, 'frame', 'C','arrow')
grid on
% Para crear puntos 
P = [1; 2]; %
plot_point(P, '*');


