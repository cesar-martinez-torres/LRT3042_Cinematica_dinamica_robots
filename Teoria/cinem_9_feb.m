% Robot Planar 1gdl
syms q1 a1
aTb=trotz(q1)*transl(a1,0,0)
% Robot Planar 2gdl
syms q1 a1 q2 a2
aTb=trotz(q1)*transl(a1,0,0)
bTc=trotz(q2)*transl(a2,0,0)
aTc=aTb*bTc