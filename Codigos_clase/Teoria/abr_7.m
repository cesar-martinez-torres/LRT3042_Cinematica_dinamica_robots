%%
close all
clear 
l1=5
q3=5
A(1)= Link([0 l1 0 pi/2 0]); %Generar cada una de las articulaciones 
A(2)= Link([0 0 0 -pi/2 0]);%th,d,a,alpha, tipo art; 0=rot 1=pris
A(3)= Link([0 0 0 0 1]);
A(3).qlim = [0 q3];
diap37= SerialLink(A, 'name', 'Diap 37'); %Unir articulaciones
clear
l1=5
syms q1 q2 q3
AtB=trotz(q1)*transl(0,0,l1)*transl(0,0,0)*trotx(pi/2)
BtC=trotz(q2)*transl(0,0,0)*transl(0,0,0)*trotx(-pi/2)
CtD=trotz(0)*transl(0,0,q3)*transl(0,0,0)*trotx(0)
T=AtB*BtC*CtD
syms nx ny nz ox oy oz ax ay az px py pz
noap=[nx ox ax px;ny oy ay py;nz oz az pz;0 0 0 1]
izq1=inv(AtB)*noap
izq1=simplify(izq1)
der1=BtC*CtD
der1=simplify(der1)
ec1x=izq1(1,4)==der1(1,4)
ec1y=izq1(2,4)==der1(2,4)
ec1z=izq1(3,4)==der1(3,4)
% Usando la ec4 de la tabla y ec1z
a=-py
b=px
q1sol1=atan2(a,-b)
q1sol2=atan2(-a,b)