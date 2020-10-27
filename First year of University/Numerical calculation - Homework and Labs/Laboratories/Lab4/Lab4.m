%Ex.1 
A = [0 1 1; 2 1 5; 4 2 1];
b = [3 5 1];
[L, U, W] = FactLU(A)
%Se verifica urmatoare egalitate L*U = A(W, :);
[L, U, W, x] = FactLU(A, b)

[x] = GaussPivTotal(A, b)

%% Exercitiul nr.2
% a)
% A*x = b <=> a1,1 * x1 + a1,2 * x2 + ... a1,n*xn = a1,1 + ... +a1,n;
%               ...
%             an,1 * x1 + an,2 * x2 + ... an, n*xn = an,1 + ...+ an, n;
% (A nesingulara - detA != 0) -> Sist. admite sol. unica
% Se obs. ca x = (1, 1...1) - solutie! Intrucat sol. este unica -> X
% solutia sistemului


% b)
n = 100;
A = randi(10, n, n);
b = zeros(1, n);
for i=1:n
    for j=1:n
        b(i) = b(i) + A(i, j);
    end
end
[L, U, W, x] = FactLU(A, b)

%c) 
Xold = ones(n, 1);

tic
for k=1:100
    %A*Xnew = Xold + 2;
    [Xnew] = GaussPivTotal(A, Xold+2);
    Xnew = transpose(Xnew);
    Xold = Xnew;
end
toc 

%Fact. mai intai matricea A apeland FactLU de o singura var. de intrare si
%3 var. de iesire si dupa aceea rezolva sist.
tic
for k=1:100
    %A*Xnew = Xold + 2;
    b = Xold + 2;
    bprim = b(W);
    y = SubsAsc(L, bprim);
    Xnew = SubsDesc(U, y);
    Xnew = transpose(Xnew);
    Xold = Xnew;
end
toc 
    