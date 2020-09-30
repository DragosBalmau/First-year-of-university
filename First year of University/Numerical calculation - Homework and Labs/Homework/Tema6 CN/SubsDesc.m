function [x] = SubsDesc(A,b)
%SubsDesc rezolva sisteme superior triunghiulare

%Synopsis: [x] = SubsDesc(A,b)

%Input: A = matrice patratica de ordinul n,
%       superior triunghiulara (aij = 0, i>j)
%       b = vectorul termenilor liberi

%Output: x = solutia sistemului

%------Vericare matrice patratica
[n,m] = size(A);
if n~=m 
    error('Matricea nu este patratica')
    x = [];
    return
end

%--- Verificare daca matricea este superior triunghiulara
for i = 2:n
    for j = 1:i-1
        if A(i,j)~=0
            error('Matricea nu este superior triunghiulara')
            x = [];
            return
        end
    end
end
%----Verificare incompatibilitate sistem
for i=1:n
    if A(i,i)==0
        error('Sistemul nu admite solutie unica')
        x = [];
        return
    end
end

%---Rezolvarea sistemului
x(n) = b(n)/A(n,n);
k = n-1;
while k>0
    sum = 0;
    for j = k+1:n
        sum = sum + A(k,j)*x(j);
    end
    x(k) = 1/A(k,k)*(b(k) - sum);
    k = k - 1;
end
