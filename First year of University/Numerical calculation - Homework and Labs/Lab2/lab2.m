%Elemente de programare

%x = linspace(-3,5,100)
%y=F(x)
%plot(x,y,'.','Markersize',10)
f=@(x) x.^3-7*x.^2+14*x-6
df=@(x)3*x^2-14*x+14
a=-1;
b=5;
N=20;
interval=CautaIntervale(f,a,b,N)

x=linspace(a,b,100);
y=f(x);
plot(x,y,'Linewidth',3); 

hold on 

for i=1:size(interval,1)
    xmin=interval(i,1);
    xmax=interval(i,2);
    fill([xmin xmin xmax xmax xmin],[-0.3 0.3 0.3 -0.3 0.3],[0.6 0.7 0.8 0.9 0.6]);
    xaprox(i)=Bisectie(f,xmin,xmax,10^-5)
    
    
end

plot(xaprox,f(xaprox),'o');


r(1)=NR(f,df,1,10^-5)
r(2)=NR(f,df,3.1,10^-5)
r(3)=NR(f,df,4,10^-5)




