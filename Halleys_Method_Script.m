
clc; clear all


f =@(x) log(x) + x;
fp =@(x) 1 + 1/x;
f2p =@(x) -1/(x^2);
x0 = 2;
xtol = 1e-18;
ftol='';
kmax = 1000;

[x2,xerr2,ferr2,k2] = halley(f,fp,f2p,x0,xtol,ftol,kmax);

