function [L, U, W, x] = FactLU(A, b)
%FactLU - factorizeaza LU matricea A si rezolva sistemul de ecuatii Ax = b

%Synopsis
%       [L, U] = FactLU(A)
%       [L, U, x] = FactLU(A, b)

%Input - Matricea A - o matrice patratica
%      - Vectorul b - vectorul termenilor liberi

%Output - L - matricea inf. tr. (Lii = 1)i = 1->n
%       - U - matricea sup. tr. (Uij = 0) i>j
%       - W - vectorul perm.
%       - x - vect. solutie


%Verific daca matricea este patratica
[n, m ] = size(A);
if n~=m
    error('Matricea nu este patratica');
end

if nargin == 2
    if  length(b) ~= n
        error('Dimensiuni incompatibile');
    end
end

L = zeros(n);
%init matrice L
for i = 1:n
    L(i, i) = 1;
end

%init vector W
W = 1:n;

for k = 1:n-1
    var_max = abs(A(k, k));
    % p - coord liniei
    p = k;
    for j = k+1:n
        if var_max < abs(A(j, k))
            var_max = abs(A(j, k));
             p = j;
        end
    end
    
    if var_max == 0
        error('A nu admite fact. LU');
        return
    end
    
    if p~=k
        A([p, k], :) = A([k, p], :);
        W([p, k]) = W([k, p]);
        
        if k > 1
            L([p, k], 1:(k-1)) = L([k, p], 1:(k-1));
        end
    end
    
    for l = k+1:n
        L(l, k) = A(l, k)/A(k, k);
        A(l, k) = 0;
        A(l, k+1:n) = A(l, k+1:n) - L(l, k)*A(k, k+1:n);
    end
end

if A(n, n) == 0
    error('A nu admite fact. LU');
end
U = A;

if nargin == 2 && nargout ==4
    % Ax = b este echivalent cu LUx = b'
    % b' se calc. in baza lui b prin b(W);
    % se rez. sistemele Ly = b' si Ux = y;
    %                   ^- matrice inferior triunghiulara ( se aplica
    %                   metoda subsAsc.)
    %                               ^-- matrice sup. tr( se aplica metoda
    %                               subsDesc.)
    bprim = b(W);
    y = SubsAsc(L, bprim);
    x = SubsDesc(U, y);
end
end

