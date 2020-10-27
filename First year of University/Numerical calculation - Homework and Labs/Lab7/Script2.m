clear all
close all
f = @(x)sin(x);
a=0;
b=pi;
n=8; %4,6,8
m=100;
x = zeros(1,m + 1);
x(2:m) = linspace(a,b,m - 1);
h = (b - a)/(m - 2);
x(1) = x(2) - h;
x(m + 1) = x(m) + h;

syms X %Declaram variabila X

F = f(X) %Construim expresia simbolic F in baza functiei f

df = diff(F,X); %Calculam o alta expresie simbolica reprezentand derivata lui F
dff = diff(df,X); % Calculam derivata de ordinul 2, dff reprezentand o expresie simbolica 

df = matlabFunction(df,'vars',{X});
dff = matlabFunction(dff,'vars',{X});

metoda = 'diferente finite centrale';

for i = 2:m
    dy(i) = MetRichardson(f,x(i),h,n);
end

for i = 2:m
    dy2(i) = MetRichardson2(f,x(i),h,n-1);
end

figure(1)
plot(x(2:m),dy(2:m),'--b','LineWidth',3);

grid on
hold on

plot(x(2:m),df(x(2:m)),'--r','LineWidth',3);

figure(2)

plot(x(2:m),abs(dy(2:m)-df(x(2:m))),'--r','LineWidth',3);

%Pentru derivata de ordin 2

figure(3)

plot(x(2:m),dff(x(2:m)),'--r','LineWidth',3);

grid on
hold on

plot(x(2:m),dy2(2:m),'--r','LineWidth',3);

figure(4)

plot(x(2:m),abs(dy2(2:m)-dff(x(2:m))),'--r','LineWidth',3);


