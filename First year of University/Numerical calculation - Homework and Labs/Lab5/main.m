clear all;
close all;
clc;

f=@(x)sin(x);
n=10;
LimInf=-(pi/2);
LimSup=pi/2;
X=linspace(LimInf, LimSup, n+1);
Y=f(X);

plot(X,Y,'o','markerfacecolor','b','markersize',10);

for i=1:(n+1)
    for j=1:(n+1)
   
        A(i,j)=X(i)^(j-1);
        
    end
end

disp(A)
Y=transpose(Y);

a=GaussPivTot(A,Y)

Pn=0;
x=0.5;
xgraf=linspace(LimInf, LimSup, 100);

for i=1:(n+1)
   
    Pn=Pn + a(i) * x^(i-1);
    
end

PnGraf=zeros(1, 100);

for i=1:(n+1)
   
    PnGraf = PnGraf + a(i) * xgraf.^(i-1);
    
end

hold on;
plot(xgraf, PnGraf,'b', 'linewidth', 3);
plot(xgraf, f(xgraf), '--r','linewidth', 2);
grid on;
legend('Puncte de interpolare (Xi, Yi)', 'Polinomul Pn(x)', 'Functia f(x)=sin(x)');

figure(2);

plot(xgraf, abs(f(xgraf)-PnGraf));
grid on;