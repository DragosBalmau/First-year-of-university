%a. V2
f=@(x) 2*x+3*cos(2*x)-x;
a=-2;
b=3;
x=linspace(a,b,100);
y=f(x);
plot(x,y,'Linewidth',1);
hold on

%b.
x0=-1;
x1=0;
MetSecantei(f,a,b,x0,x1,10^-3)

%c
MetPozFalse(f,a,b,10^-3)

%d
N=20;
interval=CautaIntervale(f,a,b,N);
for i=1:size(interval,1)
    xmin=interval(i,1);
    xmax=interval(i,2);
    fill([xmin xmin xmax xmax xmin],[0.3 0.3 0.3 -0.1 0.2],[0.6 0.7 0.8 0.9 0.6]);
    xaprox(i)=MetSecantei(f,a,b,xmin,xmax,10^-3);
   
end

plot(xaprox,f(xaprox),'x','MarkerSize',10,'MarkerEdgeColor','m');

%e
%Intervale luate de la d.
%[-0.75,-0.5]
xaprox2(1)=MetPozFalse(f,-0.75,-0.5,10^-3);
%[0.75,1]
xaprox2(2)=MetPozFalse(f,0.75,1,10^-3);
%[1.75,2]
xaprox2(3)=MetPozFalse(f,1.75,2,10^-3);

plot(xaprox2,f(xaprox2),'o','MarkerSize',10,'MarkerEdgeColor','r');

