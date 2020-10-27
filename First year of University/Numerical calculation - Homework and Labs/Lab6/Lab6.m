%Exercitiul 1: Date de intrare
clear all;
close all;
clc;
f = @(x)sin(x);
fp = @(x)cos(x);
a = -pi/2;
b = pi/2;
n = 80;
X = linspace(a, b, n+1); % nodurile de interpolare
Y = f(X);
plot(X, f(X), 'bo');
hold on;
xgraf = linspace(a, b, 200);
[S, Sp, Spp, C] = SplineCubica(X, Y, fp(X(1)), fp(X(n+1)), xgraf);
plot(xgraf, f(xgraf), '--r');
plot(xgraf, S, '--b');
figure(2);
plot(xgraf, Sp, '--b');
figure(3);
plot(xgraf, Spp, '--b');

figure(4)
plot(xgraf, abs(f(xgraf) - S), '--r');