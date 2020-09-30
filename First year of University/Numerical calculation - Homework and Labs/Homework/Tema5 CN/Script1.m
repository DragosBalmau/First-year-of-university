%%
%Ex 1 - V2 - a,b

X = [-2 1 3 7];
Y = [5 7 11 34];
    
Pn=0;

n = length(X);   

xmin = -2;
xmax = 7;

syms Lnk x   
    
for k = 1 : n
        
    produs = 1;
        
    for i = 1 : n           
            
        if (i~=k)              
                
            produs = produs *((x-X(i))/(X(k)-X(i)));    
                
        end
            
    end
       
    Pn = Pn + produs * Y(k); %%Metoda Lagrange
        
    Lnk = produs;
        
    figure;                
    ezplot(Lnk,[xmin, xmax])
    
    hold on        
    grid on
        
end

figure  
ezplot(Pn,[xmin, xmax])

hold on;
plot(X,Y,"o");

grid on;
axis on;

%%
%Ex 2

X = [0.9 1.3 1.9 2.1 2.6 3.0 3.9 4.4 4.7 5.0 6.0 7.0 8.0 9.2 10.5 11.3 11.6 12.0 12.6 13.0 13.3];
Y = [1.3 1.5 1.85 2.1 2.6 2.7 2.4 2.15 2.05 2.1 2.25 2.3 2.25 1.95 1.4 0.9 0.7 0.6 0.5 0.4 0.25];

x = linspace(0.9,13.3,200);

Pn = N(X,Y,x); 

figure;

plot(x,Pn, "-")

grid on 
hold on 
axis equal

plot(X ,Y, "o")

axis equal













