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
clear q3
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
%%
izq2=inv(BtC)*inv(AtB)*noap
izq2=simplify(izq2)
der2=CtD
der2=simplify(der2)
ec2x=izq2(1,4)==der2(1,4)
ec2y=izq2(2,4)==der2(2,4)
ec2z=izq2(3,4)==der2(3,4)
k1=px*cos(q1)
k2=py*sin(q1)
a1=k1+k2
b1=pz-5
q2_sol1=atan2(a1,-b1)
q2_sol2=atan2(-a1,b1)
% Podemos continuar en simbolico o evaluar T original
T=diap37.fkine([pi,pi/4,3.2])
T=T.T
a=-T(2,4)
b=T(1,4)
q1sol1=atan2(a,-b)
q1sol2=atan2(-a,b)
%% Resolver q2
px=T(1,4)
py=T(2,4)
pz=T(3,4)
q1=pi
k1=px*cos(q1)
k2=py*sin(q1)
a1=k1+k2
b1=pz-5
q1s1_q2s1=atan2(a1,-b1)
q1=pi
q2=q1s1_q2s1
q1s1_q2s1_q3s1=eval(ec2z)
q1s1_q2s1_q3s1=[q1 q2 -16/5]
Ta=diap37.fkine(q1s1_q2s1_q3s1)
