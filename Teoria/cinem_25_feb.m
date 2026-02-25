%% Denavit Hartenberg 3R Planar
%Paso 14
syms q1 q2 q3% Radianes
L1=2;
L2=2;
L3=0.5;
aTb=trotz(q1)*transl(0,0,0)*transl(L1,0,0)*trotx(0)
bTc=trotz(q2)*transl(0,0,0)*transl(L2,0,0)*trotx(0)
cTd=trotz(q3)*transl(0,0,0)*transl(L3,0,0)*trotx(0)
% Paso 15
T = aTb * bTc * cTd
T=simplify(T)
x=T(1,4)
y=T(2,4)
z=T(3,4)
q1g=90
q2g=0
q3g=0
q1=deg2rad(q1g)
q2=deg2rad(q2g)
q3=deg2rad(q3g)
T1=eval(T)
xf=eval(x)
yf = eval(y)
zf = eval(z)
rpy=tr2rpy(T1,'deg')