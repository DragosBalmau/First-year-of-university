function [rang,A_final] = Rang(A, tol)

    %Rang este o functie care returneaza rangul unei matrici
    %Synopsis: [rang,A_final] = Rang(A)
    %          [rang,A_final] = Rang(A, tol)
    %          [rang] = Rang(A, tol)
    %Input: A matricea cu n linii si m coloane
    %       tol este optional un paramteru cu care comparam nu,ere foarte
    %       mici. Implicit, tol=10^(-10)
    %Output: rangul matricei
    %       A_final forma Echelon, forma finala a matricei A
    if(nargin<2)
        tol=10^(-10);
    end
    
    % se calculeaza dimensiune matricii
    [m,n]=size(A);
    % se initializeaza linia, coloana si rangul
    h=1;
    k=1;
    rang=0;
    
    while(h<=m & k<=n)
        var_max=abs(A(h,k));
        p=h;
        for j=h+1:m
            if var_max<abs(A(j,k))
                var_max=abs(A(j,k))
                p=j;
            end
        end
        if(var_max<=tol)
            var_max=0;
            k=k+1;
            continue
        end
        
        if p~=h
        A([p,h],:)=A([h,p],:);
        end
        
        for l=h+1:m
            mlk=A(1,k)/A(h,k);
            A(l, :)=A(1, :)-mlk*A(h,:);
        end
        k=k+1;
        h=h+1;
        rang=rang+1;
        
    end
    
    if(nargout>1)
        A_final=A;


end

