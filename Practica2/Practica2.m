% PRÁCTICA 2 DE SISTEMAS DIGITALES DE CONTROL
clear all; close all; clc;

z=tf('z');
s=tf('s');
%% Ejercicio 2.1 

%G_D= 2.5*(1-0.6*z^-1)/(1+0.75*z^-1)
H_s=1/s^2;
H_z=c2d(H_s,1,'zoh');
[b, a]=tfdata(H_z,'v');
fvtool(b,a);
% Se obtienen valores muy extraños usando el comando Bode directamente
%bode (H_z)

%% Ejercicio 2.2 Con el método de Tustin
H_z_tustin=c2d(H_s,1,'tustin');
[b_tustin, a_tustin]=tfdata(H_z_tustin,'v');
fvtool(b_tustin,a_tustin);

%% Ejercicio 2.3 con 
G_p=(2.3798*z -1.9387)/(z - 0.5589);
for k = 1:4        
    H_s=k/(s^2+s);
    H_z=c2d(H_s,1,'tustin')
    [b, a]=tfdata(H_z,'v');
    fdt(k)=feedback(H_z*G_p,1);
    fvtool(b,a);
end
% Compara las funciones de transferencia de GD(z), GD(z)·H(z) y Y(z)/X(z).
ltiview({'step';'bode'},fdt(1),fdt(2),fdt(3))

%% Ejercicio 2.4 Filtro 
n=2;
Wn=4/12;
[b,a]=butter(n,Wn)
% dfilt.df2(b,a)  --> Esto hace la direct form 2 directamente
