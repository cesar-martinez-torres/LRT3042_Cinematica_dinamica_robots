%% "Armar" Robot
clear 
close all
% Cargar línea a línea la tabla de parámetros DH
% theta d a alpha tipo de articulación
L(1)= Link([0 0 2 0 0]); %Generar cada uno de los eslabones
L(2)= Link([0 0 2.5 0 0]);
L(3)= Link([0 0 1 0 0]);
RRR= SerialLink(L, 'name', 'Planar 3GDL'); % Armar el robot uniendo los eslabones

Q=[pi/16 pi/22 pi/45
    ;0 0 0
    ;pi/10 pi/20 pi/22
    ;pi/5 pi/2 pi
    ;pi/4 pi/24 pi/6
    ;pi/3 pi/25 pi/8
    ;pi/2 pi/29 pi/15]
T=RRR.fkine(Q) %Evalua la cin directa
angr=tr2rpy(T,'xyz')
angg=rad2deg(angr)
figure
RRR.plot(Q) % Dibujar el robot en la posición inicial, con todas las articulaciones en 0. Agregar los valores de las articulaciones de acuerdo a la cantidad de grados de libertad del robot
%figure
%RRR.teach