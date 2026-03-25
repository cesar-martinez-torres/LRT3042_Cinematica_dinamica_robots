%% Robot Diapositiva 28
clear 
close all
% Cargar línea a línea la tabla de parámetros DH
% theta d a alpha tipo de articulación
l1=2;
l4=1;
L(1)= Link([0 l1 0 0 0]); %Generar cada uno de los eslabones
L(2)= Link([pi/2 0 0 pi/2 1]);
L(2).qlim=[0 3];
L(3)= Link([0 0 0 0 1]);
L(3).qlim=[0 2];
L(4)= Link([0 l4 0 0 0]);
diap28= SerialLink(L, 'name', 'Diapo 28'); % Armar el robot uniendo los eslabones
Q=[pi 0 1.2 0]
figure
diap28.plot([Q]) % Dibujar el robot en la posición inicial, con todas las articulaciones en 0. Agregar los valores de las articulaciones de acuerdo a la cantidad de grados de libertad del robot
%figure
%diap28.teach
aTe=diap28.fkine(Q)
[T,ALL]=diap28.fkine(Q)
rpy=tr2rpy(aTe,'deg')
xyz=aTe.t