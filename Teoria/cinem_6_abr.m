%% Robot Diap 37
l1=2;
L(1)=Link([0 l1 0 pi/2 0]);
L(2)=Link([0 0 0 -pi/2 0]);
L(3)=Link([0 0 0 0 1]);
L(3).qlim=[0 2];
diap37=SerialLink(L, 'name', 'Diapo 37');
%figure
%diap37.teach
syms q1 q2 q3 nx ny nz ox oy oz ax ay az px py pz 
T=[nx ox ax px; ny oy ay py;nz oz az pz;0 0 0 1];
aTb=trotz(q1)*transl(0,0,l1)*transl(0,0,0)*trotx(pi/2)
bTc=trotz(q2)*transl(0,0,0)*transl(0,0,0)*trotx(-pi/2)
cTd=trotz(0)*transl(0,0,q3)*transl(0,0,0)*trotx(0)
% Primer Paso
izq1=inv(aTb)*T
izq1=simplify(izq1)
der1=bTc*cTd
der1=simplify(der1)
ec1=izq1(3,4)==der1(3,4)
% Por identificacion en la ec4 de la tabla
a1=-py
b1=px
q1sol1=atan2(a1,-b1)
q1sol2=atan2(-a1,b1)
%Segundo paso
izq2=inv(bTc)*izq1
izq2=simplify(izq2)
der2=cTd
ec2=izq2(1,4)==der2(1,4)
ec3=izq2(3,4)==der2(3,4)
u=px*cos(q1)
v=py*sin(q1)
a2=u+v
b2=pz-2
q2sol1=atan2(a2,-b2)
q2sol2=atan2(-a2,b2)

%% Resolviendo numericamente
Q=[pi 0 1.5]
T=diap37.fkine(Q)
pos=T.t
a1=-pos(2)
b1=pos(1)
q1sol1=atan2(a1,-b1)
q1sol2=atan2(-a1,b1)
% Para sol 1
u1=pos(1)*cos(q1sol1)
v1=pos(2)*sin(q1sol1)
a21=u1+v1
b21=pos(3)-2
q2sol1=atan2(a21,-b21)
q2sol2=atan2(-a21,b21)
q3sol1=pos(3)*cos(q2sol1) - 2*cos(q2sol1) - pos(1)*cos(q1sol1)*sin(q2sol1) - pos(2)*sin(q1sol1)*sin(q2sol1)
sol1=[q1sol1 q2sol1 q3sol1] % Solucion no factible, la prismatica no puede tener valores negativos.
% Solucion 2 q1sol1 => q2sol2 => q3sol1
q3sol1=pos(3)*cos(q2sol2) - 2*cos(q2sol2) - pos(1)*cos(q1sol1)*sin(q2sol2) - pos(2)*sin(q1sol1)*sin(q2sol2)
sol2=[q1sol1 q2sol2 q3sol1]
% Solucion 3 q1sol2 => q2sol1 => q3sol1
q3sol1=pos(3)*cos(q2sol1) - 2*cos(q2sol1) - pos(1)*cos(q1sol2)*sin(q2sol1) - pos(2)*sin(q1sol2)*sin(q2sol1)
sol3=[q1sol2 q2sol1 q3sol1] % Solucion no factible, la prismatica no puede tener valores negativos.
% Solucion 4 q1sol2 => q2sol2 => q3sol1
q3sol1=pos(3)*cos(q2sol2) - 2*cos(q2sol2) - pos(1)*cos(q1sol2)*sin(q2sol2) - pos(2)*sin(q1sol2)*sin(q2sol2)
sol4=[q1sol2 q2sol2 q3sol1]
% Verificar solucion
T1=diap37.fkine(sol1)
pos1=T1.t
error=pos - pos1
error_ori=(T.R)-(T1.R)





% %Para solucion 2
% u2=px*cos(q1sol2)
% v2=py*sin(q1sol2)
% a22=u2+v2
% b22=pz-2
% q2sol2=atan2(-a2,b2)
% 
% q3sol1=ec3



