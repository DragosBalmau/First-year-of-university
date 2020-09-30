function [InvA,DetA] = InvDet(A)

n=size(A, 1);
%Determinantul
CopieA=A;
[C,x]=GaussPivTot(CopieA);
ProdusDiag=1;
for i=1:n
    ProdusDiag = ProdusDiag * C(i,i);
end

%Inversa
for i=1:n
    for j=1:2*n
        if(i<=n & j<=n)
            B(i,j)=A(i,j);
        elseif(i+n==j)
            B(i,j)=1;
        else
            B(i,j)=0;
        end
    end
end
    
    GaussPivTot(B);
    GaussPivTot(A);
    for i=1:n
        D(:, i)=GaussPivTot(A,B(:,i+n));
    end
    InvA=D
    DetA=((-1)^x)*ProdusDiag   
end

