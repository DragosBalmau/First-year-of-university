function [x] = GaussPivPartial(A, b)
%GaussPivPartial rezolva sisteme patratice de ecuatii liniare

%Synopsis [x] = GaussPivPartial(A, b)
%Input A este matricea patratica asociata sitemului
%      b este vectorul termenilor liberi
%Output x este vectorul solutie
%--------Verificare matrice patratica
[n,m] = size(A);
if n~=m
    error('Matricea nu este patratica')
    x = []
    return
end
%--------Verificare dimensiune vector
if length(b)~=n
    error('Dimensiunea vectorului nu corespunde')
end
if length(b) ~= size(b)
    b = transpose(b);
end
for i = 1:length(b)
    A(i, size(b) + 1) = b(i);
end
for k=1:n-1
    var_max=abs(A(k, k));
    p = k;
    
    for j =k+1:n
        if var_max < abs(A(j, k))
            var_max = abs(A(j, k));
            p = j;
        end
    end
    if var_max == 0
        error('Sistemul nu admite solutie unica');
        x = [];
        return
    end
    if p~=k
        for i=1:length(b)+1
            val_aux = A(p, i);
            A(p, i) = A(k, i);
            A(k, i) = val_aux;
        end
    end
    for l=k+1:n
       mlk = A(l, k)/A(k, k);
       A(l, :) =  A(l, :) - mlk*A(k, :);
    end
end
if A(n, n) == 0
    error('Sistemul nu admite solutie unica')
    x = [];
    return
end
x = SubsDesc(A(:, l:length(b)), A(:, length(b)+1));
end