function [d2f] = MetRichardson2(f,x,h,n)

%Input : f - functia pe care o derivam
%        x - variabila curenta
%        h - pas
%        n - ordinul de aproximare
    
phi = @(h)(f(x + h) - 2 * f(x) + f(x - h))/h^2 % formula de aprox a derivatei de ordinul h

for i = 1:n
    Q(i,1) = phi(h/2^(i-1));
end

for i = 2:n
    for j = 2:i
        Q(i,j) =(2^(j-1)*Q(i,j-1)-Q(i-1,j-1))/(2^(j-1)-1);
    end
end    
    d2f = Q(n,n);
end

