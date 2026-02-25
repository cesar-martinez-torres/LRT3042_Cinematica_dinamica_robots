%% Pincher X
syms q1 q2 q3 q4 %Radianes
a1=95%mm
a2=137-95%mm
a3=105%mm
a4=105%mm
aTb=trotz(q1)*transl(0,0,a1)
bTc=troty(q2)*transl(0,0,a2)
cTd=troty(q3)*transl(0,0,a3)
dTe=troty(q4)*transl(0,0,a4)
aTe=aTb*bTc*cTd*dTe
aTe=simplify(aTe)
q1g=0
q2g=0
q3g=90
q4g=0
q1=deg2rad(q1g)
q2=deg2rad(q2g)
q3=deg2rad(q3g)
q4=deg2rad(q4g)
T=eval(aTe)
rpy=tr2rpy(T,'deg')