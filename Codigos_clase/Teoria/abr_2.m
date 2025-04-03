%% "Armar" Robot
clear 
close all
l1=5
l2=5
l4=3
d3=3
L(1) = Link([0 0 l1 0 0])
L(2) = Link([0 0 l2 pi 0])
L(3) = Link([0 0 0 0 1])
L(3).qlim=[0 d3];
L(4) = Link([0 l4 0 0 0])
SCARA= SerialLink(L, 'name', 'SCARA','manufacturer','UDLAP'); % Armar el robot uniendo los eslabones
Q=[0 0 0 0]
T=SCARA.fkine(Q) %Evalua la cin directa
angr=tr2rpy(T,'xyz')
angg=rad2deg(angr)
AtB=SCARA.A(1,Q)% Matriz de TH AtB con q1=0
BtC=SCARA.A(2,Q)% Matriz de TH BtC con q2=0
CtD=SCARA.A(3,Q)% Matriz de TH CtD con q3=0
DtE=SCARA.A(4,Q)% Matriz de TH DtE con q4=0

figure
SCARA.plot(Q)


% Dibujar el robot en la posición inicial, con todas las articulaciones en 0. Agregar los valores de las articulaciones de acuerdo a la cantidad de grados de libertad del robot
%figure
%SCARA.teach