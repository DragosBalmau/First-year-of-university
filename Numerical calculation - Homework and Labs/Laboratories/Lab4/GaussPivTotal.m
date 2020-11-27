function [x] = GaussPivTotal(A, b)
%GaussPivPartial rezolva sisteme patratice de ecuatii liniare

%Synopsis [x] = GaussPivPartial(A,b)
%Input A este matricea patratica asociata sistemului
%       b este vectorul termenilor liberi

%Output x este vectorul solutie

%Verificare matrice patratica
[n,m] = size(A);
if n~=m
    disp('Matricea nu este patratica')
    x=[];
    return
end

if length(b)==size(b,2)
   
    b=transpose(b);
    
end
%Concatenez matricea A si vectorul transpus b -> matricea extinsa
A = [A b];

%Construirea vectorului index
index = 1:n;

%Algoritm:
for k = 1:(n-1)
    %Determin elementul maximal si indicii acestuia (k<=p,m<=n)
     maxim = abs(A(k, k)); %consider ca elementul maximal este deja asezat in pozitia corespunzatoare
     
     %coord_X, coord_y ->Notatie pentru claritatea algoritmului
     coord_X = k;
     coord_Y = k;
     for i = k:n
         for j = k:n
             if abs(A(i, j)) > maxim
                 maxim = abs(A(i, j));
                 coord_X = i;
                 coord_Y = j;
            end
        end
     end
    p = coord_X;
    m = coord_Y;
    
    %Verific natura sistemului
    if A(p, m) == 0
        disp('Sistem incompatibil sau nedeterminat');
        x = [];
        return
    end
    
    %Mut elementul maximal pe pozitia  (k, k)
    if p~=k
        %Interschimb liniile Lp<->Lk
        A([p, k], :) = A([k, p], :);
    end
    if m~=k
        %Interschimb coloanele Lm<->Lk
        A(:, [m, k]) = A(:, [k, m]);
        %Interschimb pozitiile din vectorul index
        index(:, [m, k]) = index(:, [k, m]);
    end
    
    for l=(k+1):n
        mlk = A(l, k)/A(k, k);
        A(l, k) = 0;
        A(l, k+1:n+1) = A(l, k+1:n+1) - mlk*A(k, k+1:n+1);
    end
end
if A(n, n) == 0
    disp('Sistem incompatibil sau compatibil nedeterminat');
    x = [];
    return
end

y = SubsDesc(A(:, 1:n), A(:, n+1));

%Punerea in ordine a solutiilor
for i = 1:n
    x(index(i)) = y(i);

end

