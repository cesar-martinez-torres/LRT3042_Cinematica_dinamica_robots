%% Robot planar 1GDL lim -180 a 180
clear
close all
syms q1
a1=1.5
mr=trotz(q1)
mt=transl(a1,0,0)
aTb=mr*mt
aTb=vpa(aTb)
% Sensor nos entrega el valor de q1
q1g=90
q1=deg2rad(q1g)
Tev=eval(aTb)
rpy=tr2rpy(Tev)
rpyg=rad2deg(rpy)
W=SE3(0,0,0)
figure
trplot(W,'frame','W','color','k')
hold on
trplot(Tev,'frame','T','color','b')
grid on
pause()
%% Robot planar de 2GDL
clear 
close all
syms q1 q2
l1=1.5
l2=2
mr=trotz(q1)
mt=transl(l1,0,0)
aTb=mr*mt
mr=trotz(q2)
mt=transl(l2,0,0)
bTc=mr*mt
T=aTb*bTc
T=simplify(T)
% Sensor nos entrega el valor de q1 y q2
q1g=90
q2g=90
q1=deg2rad(q1g)
q2=deg2rad(q2g)
Tev=eval(T)
rpy=tr2rpy(Tev)
rpyg=rad2deg(rpy)
W=SE3(0,0,0)
figure
trplot(W,'frame','W','color','k')
hold on
trplot(Tev,'frame','T','color','b')
grid on
pause()
%% Robot planar de 3GDL
clear 
close all
syms q1 q2 q3
a1=1.5
a2=1.5
a3=1.5
mr=trotz(q1)
mt=transl(a1,0,0)
aTb=mr*mt
mr=trotz(q2)
mt=transl(a2,0,0)
bTc=mr*mt
mr=trotz(q3)
mt=transl(a3,0,0)
cTd=mr*mt
T=aTb*bTc*cTd
T=simplify(T)
% Sensor nos entrega el valor de q1, q2 y q3
q1g=90
q2g=90
q3g=90
q1=deg2rad(q1g)
q2=deg2rad(q2g)
q3=deg2rad(q3g)
Tev=eval(T)
rpy=tr2rpy(Tev)
rpyg=rad2deg(rpy)
W=SE3(0,0,0)
figure
trplot(W,'frame','W','color','k')
hold on
trplot(Tev,'frame','T','color','b')
grid on
pause()
