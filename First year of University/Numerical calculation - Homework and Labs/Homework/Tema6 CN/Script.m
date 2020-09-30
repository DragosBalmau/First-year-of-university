%% Problema 1 - V2

%Doar a) - SplineL

%% Problema 2 
X = [2 3 5 8 12];
Y = [10 15 25 40 60];

fpa = (Y(2)-Y(1))/(X(2)-X(1));

x = linspace(2,12,200);

y = SplineP(X,Y,x,fpa);

%% Problema 3

X1=[1 2 5 6 7 8 10 13 17];
Y1=[3.0 3.7 3.9 4.2 5.7 6.6 7.1 6.7 4.5];

X2=[17 20 23 24 25 27 27.7];
Y2=[4.5 7.0 6.1 5.6 5.8 5.2 4.1];

X3=[27.7 28 29 30];
Y3=[4.1 4.3 4.1 3.0];

x1 = linspace(X1(1), X1(length(X1)), 200);
x2 = linspace(X2(1), X2(length(X2)), 200);
x3 = linspace(X3(1), X3(length(X3)), 200);
 
y1 = SplineCubica(X1,Y1,1,-0.67,x1);
y2 = SplineCubica(X2,Y2,3,-4,x2);
y3 = SplineCubica(X3,Y3,0.33,-1.5,x3);
 
figure(1);
grid on;

plot(x1,y1,'-');
hold on;
plot(x2,y2,'-');
hold on;
plot(x3,y3,'-');

axis equal;

