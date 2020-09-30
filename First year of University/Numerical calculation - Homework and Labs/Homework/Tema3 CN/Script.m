%%
%Exercitiul 1
A = [0 1 1;2 1 5;4 2 1];
b = [3;5;1];

GaussPivTot(A,b)

A = [0 1 -2;1 -1 1; 1 0 -1];
b = [4;6;2];
GaussPivTot(A,b)
%%
%Exercitiul 2 - V2
d=15; 
f=-5;
c=-4;
n=7;

for i=1:n
    for j=1:n
        if(i==j)
            A(i,j)=d;   
        elseif(i+1==j)
            A(i,j)=f;
        elseif(i==j+1)
            A(i,j)=c;
        else
            A(i,j)=0;
        end
    end
end

for i=1:n
    if(i==1 | i==n)
        b(i)=2;
    else
        b(i)=1;
    end    
end

GaussPivTot(A,b)

%%
%Exercitiul 3

%a
[InvA,DetA]=InvDet(A);

%b
%GaussPivTot(inv(A),b)

%Da eroare deoarece cu InvA nu se poate rezolva sistemul



 




