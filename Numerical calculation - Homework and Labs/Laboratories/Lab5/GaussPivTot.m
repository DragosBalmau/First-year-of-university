function [x] = GaussPivTot(A, b)

n=length(b);
A=[A b];

index=[1:n];

for k=1:n

    max=abs(A(k,k));
    p=k;
    m=k;
    
    for i=k:n
        for j=k:n
            if abs(A(i,j))>max
                max=abs(A(i,j));
                p=i;
                m=j;
            end
        end
    end
    
    if p~=k
        A([p,k],:)=A([k,p],:);
    end
    
    if m~=k
        A(:, [m,k]) =A(:,[k,m]);
        index([m,k])=index([k,m]);
    end
    
    for l=k+1:n
        mlk=A(l, k)/A(k,k);
        
        A(l, k) = 0;
        
        A(l,k+1:n+1)=A(l, k+1:n+1)-mlk*A(k, k+1:n+1);
    end
    
end

    if A(n,n)==0
        disp("Sistem incompatibil/compatibil nedet");
        x="Eroare";
    return;
    end
    
    y=SubsDesc(A(:,1:n),A(:,n+1));
    
    for i=1:n
        x(index(i))=y(i);
    end
end

