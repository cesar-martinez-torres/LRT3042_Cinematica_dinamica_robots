%% Phantom X
syms q1 q2 q3 q4 % a`s en mm
a1=42
a2=105
a3=105
a4=30 % suponemos que son 30mm hasta la brida, posible 80 con herramienta
aTb=trotz(q1)*transl(0,0,a1)
bTc=troty(q2)*transl(0,0,a2)
cTd=troty(q3)*transl(0,0,a3)
dTe=troty(q4)*transl(0,0,a4)
aTe=aTb*bTc*cTd*dTe
aTe=simplify(aTe)
% Agregar base física y herramienta
% Pre-transformacion para la base
base=transl(0,0,95)
% Post  transfrmacion para la herramienta
herr=transl(0,0,50)
T=base*aTe*herr
T=simplify(T)
% El sensor muestra que 
q1g=0
q2g=90
q3g=0
q4g=0
q1=deg2rad(q1g)
q2=deg2rad(q2g)
q3=deg2rad(q3g)
q4=deg2rad(q4g)
Tev=eval(T)

