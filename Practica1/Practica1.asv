% PRÁCTICA 1 DE SISTEMAS DIGITALES DE CONTROL
clear all; close all; clc;

z=tf('z');
s=tf('s');
%% Ejercicio 1.1 

G_D= 2.5*(1-0.6*z^-1)/(1+0.75*z^-1)
H_s=1/s^2;
G_z=c2d(H_s,1,'zoh')
sistema=(G_D*G_z/(1+G_D*G_z));
defino=G_D*G_z
sistema_feed= feedback(defino,1)
sistema2=minreal(sistema)

%% Ejercicio 1.2

