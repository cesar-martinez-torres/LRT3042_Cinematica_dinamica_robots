%% Pincher X
syms q1 q2 q3 q4 %Radianes
a1=1%mm
a2=1%mm
a3=1%mm
a4=1%mm
aTb=trotz(q1)*transl(0,0,a1)
bTc=troty(q2)*transl(0,0,a2)
cTd=troty(q3)*transl(0,0,a3)
dTe=troty(q4)*transl(0,0,a4)
aTe=aTb*bTc*cTd*dTe
aTe=simplify(aTe)