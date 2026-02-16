%% Robot Planar 3GDL
clear
close all
syms q1 q2 q3 
a1=1
a2=2
a3=3
aTb=trotz(q1)*transl(a1,0,0)
bTc=trotz(q2)*transl(a2,0,0)
cTd=trotz(q3)*transl(a3,0,0)
aTd=aTb*bTc*cTd
fx=simplify(aTd(1,4))
fy=simplify(aTd(2,4))
r11=simplify(aTd(1,1))
r12=simplify(aTd(1,2))
r21=simplify(aTd(2,1))
r22=simplify(aTd(2,2))
q1d=45
q2d=22
q3d=12
q1=deg2rad(q1d)
q2 = deg2rad(q2d) 
q3 = deg2rad(q3d)
aTd=eval(aTd)