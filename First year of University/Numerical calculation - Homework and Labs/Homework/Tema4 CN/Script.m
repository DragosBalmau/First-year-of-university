%%
%Ex 1 
%a,b,c

A = [1 2 3;2 5 8;3 8 14];
b = [-5 -14 -25];

[x,L] = FactCholesky(A,b')

L2 = chol(A,'lower') 

%%
%Ex 2 - V2
%1
n = 10;

for i = 1 : n
    a(i)= n - i + 1; 
end

for i = 1 : n
    for j = 1 : n
        A(i,j) = a(abs(i - j)+1);
    end
end

%2

for i = 1 : n-1
    
    B = A(1:n-i,1:n-i);
    if(det(B)~=0)
        disp("Matricea este pozitiv definita");
        break;
    elseif(i == n-1)
        disp("Matricea nu este pozitiv definita");
    end
end
%3
L = chol(A,'lower')
%4
for i = 1 : n
    b(i)= i^3 + 2; 
end
[L2,x] = FactCholesky(A,b')

