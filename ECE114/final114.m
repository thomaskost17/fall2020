clc,clear all, close all;
C0_bar = [1/2 sqrt(1/2) sqrt(1/2) sqrt(1/2)];
C0 = [1/2 ; sqrt(1/2)*cos(pi/8);sqrt(1/2)*cos(pi/4); sqrt(1/2)*cos(3*pi/8)]; 
C2 = [1/2 ; sqrt(1/2)*cos(5*pi/8);sqrt(1/2)*cos(10*pi/8); sqrt(1/2)*cos(15*pi/8)]; 
C2_bar =[1/2 sqrt(1/2)*cos(6*pi/8) sqrt(1/2)*cos(10*pi/8) sqrt(1/2)*cos(14*pi/8)]; 
C0_bar = conj(C0_bar);
C0 = conj(C0);
C2 = conj(C2);
C2_bar = conj(C2_bar);

f = 1*C0*C0_bar +3*C0*C2_bar + 1*C2*C2_bar

C1 = [1/2 ; sqrt(1/2)*cos(3*pi/8);sqrt(1/2)*cos(6*pi/8); sqrt(1/2)*cos(9*pi/8)]; 
C3 = [1/2 ; sqrt(1/2)*cos(7*pi/8);sqrt(1/2)*cos(14*pi/8); sqrt(1/2)*cos(21*pi/8)]; 
C = [C0,C1, C2, C3];

x = [1;0;1;0];

4*x'*C'
C
