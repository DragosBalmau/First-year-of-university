%%
clear all
close all
f = @(x)sin(x);
a=0;
b=pi; 
m=1000;
x = zeros(1,m + 1);
x(2:m) = linspace(a,b,m - 1);
h = (b - a)/(m - 2);
x(1) = x(2) - h;
x(m + 1) = x(m) + h;
y = f(x);
 
syms X %Declaram variabila X

F = f(X) %Construim expresia simbolic F in baza functiei f

df = diff(F,X); %Calculam o alta expresie simbolica reprezentand derivata lui F

df = matlabFunction(df,'vars',{X});

metoda = 'diferente finite centrale';

dy  = DerivNum(x,y,metoda)
figure(1)
plot(x(2:m),dy(2:m),'--b','LineWidth',3);
grid on

hold on

plot(x(2:m),df(x(2:m)),'--r','LineWidth',3)

figure(2)

plot(x(2:m),abs(dy(2:m)-df(x(2:m))),'--r','LineWidth',3);

