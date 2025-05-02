mdl_puma560
me=p560.isspherical
qi=qn
Ti=p560.fkine(qi)
qf=qs
Tf=p560.fkine(qf)
T=p560.fkine(qi)
qv=p560.ikine6s(T,'lun')
Tv=p560.fkine(qv)
val=T-Tv
M=100
[Q,QD,QDD] = jtraj(qi,qf, M);
TC = ctraj(Ti, Tf, M)
Qc=p560.ikine6s(TC)
Q1=[qi; qv; qi; qv; qi; qv; qi; qv; qi; qv; qi; qv]
figure
p560.plot(Qc)
