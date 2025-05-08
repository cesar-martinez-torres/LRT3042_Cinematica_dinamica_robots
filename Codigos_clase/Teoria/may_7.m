%% 7 de mayo
clear
close all
mdl_puma560
%% Crear los waypoints
q_home=[0 0 0 0 0 0]
T_home=p560.fkine(q_home)
%%%%%%%%
q_apickg=[70 0 -180 0 0 0]
q_apick=deg2rad(q_apickg)
T_apick=p560.fkine(q_apick)
%%%%%%%%
T_apickaux=T_apick.T
T_pick=T_apickaux
T_pick(3,4)=-0.6318
q_pick=p560.ikine6s(T_pick)
%%%%%%%%
q_aplg=[-70 0 -180 0 0 0]
q_apl=deg2rad(q_aplg)
T_apl=p560.fkine(q_apl)
%%%%%%%%
T_aplaux=T_apl.T
T_pl=T_aplaux
T_pl(3,4)=-0.6318
q_pl=p560.ikine6s(T_pl)
%% 
V=100
% Movimiento 1
M1=jtraj(q_home,q_apick,V)
% Movimiento 2
T_M2=ctraj(T_apick.T,T_pick,V)
M2=p560.ikine6s(T_M2)
% Movimiento 3
T_M3=ctraj(T_pick,T_apick.T,V)
M3=p560.ikine6s(T_M3)
% Movimiento 4
M4=jtraj(q_apick,q_apl,V)
%  Movimiento 5
T_M5=ctraj(T_apl.T,T_pl,V)
M5=p560.ikine6s(T_M5)
% Movimiento 6
T_M6=ctraj(T_pl,T_apl.T,V)
M6=p560.ikine6s(T_M6)
% Movimiento 7
M7=jtraj(q_pl,q_home,V)
%% Plotear las trayectorias
M=[M1;M2;M3;M4;M5;M6;M7]
figure
p560.plot(M)


