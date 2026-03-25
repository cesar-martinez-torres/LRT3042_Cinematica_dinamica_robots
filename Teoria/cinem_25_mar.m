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



