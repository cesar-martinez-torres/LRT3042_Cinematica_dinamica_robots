%% Ejercicio 1.1
%Graficamos, asumimos que las coordenadas pertenecen al eje W.
%puntos
clear
close all
Wmie=[4;6]
Wmde=[12;6]
Wacone=[6;7]
Wacope=[10;7]
Wrdere=[12;9]
Wtgase=[12;3]
Wmih=e2h(Wmie)
Wmdh=e2h(Wmde)
Waconh=e2h(Wacone)
Wacoph=e2h(Wacope)
Wrderh=e2h(Wrdere)
Wtgash=e2h(Wtgase)

%Ejes de referencia
WtW=SE2(0,0,0)
WtC=SE2(8,2,0)

figure
trplot2(WtW,'frame','W','color','k')
hold on
trplot2(WtC,'frame','C','color','r')
plot_point(Wmie)
plot_point(Wmde)
plot_point(Wacone)
plot_point(Wacope)
plot_point(Wrdere)
plot_point(Wtgase)
grid on

% Inciso 1
CtW=inv(WtC)
Cmih=(CtW.T)*Wmih
Cmdh=(CtW.T)*Wmdh
Caconh=(CtW.T)*Waconh
Cacoph=(CtW.T)*Wacoph
Crderh=(CtW.T)*Wrderh
Ctgash=(CtW.T)*Wtgash

%% Inciso 2  C cambia de posicion
WtC=SE2(11,5,45,'deg')
Wmih=(WtC.T)*Cmih
Wmdh=(WtC.T)*Cmdh
Waconh=(WtC.T)*Caconh
Wacoph=(WtC.T)*Cacoph
Wrderh=(WtC.T)*Crderh
Wtgash=(WtC.T)*Ctgash

Wmie=h2e(Wmih)
Wmde=h2e(Wmdh)
Wacone=h2e(Waconh)
Wacope=h2e(Wacoph)
Wrdere=h2e(Wrderh)
Wtgase=h2e(Wtgash)

figure
trplot2(WtW,'frame','W','color','k')
hold on
trplot2(WtC,'frame','C','color','r')
plot_point(Wmie)
plot_point(Wmde)
plot_point(Wacone)
plot_point(Wacope)
plot_point(Wrdere)
plot_point(Wtgase)
grid on
