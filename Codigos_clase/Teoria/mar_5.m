%% Cartesiano 3GDL
syms q1 q2 q3 % Las tres son prismaticas
L1=0.2
L2=0.3
L3=0.4
aTb=transl(0,q1,0)
bTc=transl(0,0,q2)
cTd=transl(q3+L2,0,0)
aTd=aTb*bTc*cTd
aTd=simplify(aTd)
aTd=vpa(aTd)
% Pre y post transformación
base=transl(0,0,L1)
herr=transl(L3,0,0)
T=base*aTd*herr
T=simplify(T)
