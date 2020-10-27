function [x] = GaussPivPartial(A,b)

    %GaussPivPartial rezolva sisteme patratice de ecuatii liniare
    
    %Synopsis [x] = GaussPivPartial(A,b)
    
    %Input A este matricea patratica ascociata sistemului
    %      b este vectorul termenilor liberi
    
    %Output x este vectorul solutie
    
    [n,m]=size(A);
    if n~=m 
        error('Matricea nu este patratica');
        x=[];
        return
    end
    %Verificare daca b are aceeasi dimnesiune ca A
    if length(b)~=n
        error('Vectorul b are o alta dimensine')
        x=[];
        return
    end
    
    if lenght(b)==size(b,2)
        b=transpose(b);
    end    
    %A=[A b] alternativa pt for
    for i=1:length(b)
        A(i,size(b)+1)=b(i);
    end
    
    for k=1:n-1
        var_max=abs(A(k,k));
        p=k;
        for j=k:n
            if var_max<abs(A(j,k))
                var_max=abs(A(j,k))
                p=j;
            end
        end 
        if var_max==0
            error('Sistemul nu admite solutie unica');
            x=[];
            return
        end
        
        if p~=k
            
            %A([p,k], :)=A([k.p],:) schimba liniile intre ele
            for i=1:length(b)+1
                val_aux=A(p,i);
                A(p,i)=A(k,i);
                A(k,i)=val_aux;
            end
        end
        for l=k+1:n
            mlk=A(1,k)/A(k,k);
            A(l, :)=A(1, :)-mlk*A(k,:);
        end
    end
    if A(n,n)==0
        error('Sistemul nu admite sol unica');
        x=[];
        return
    end
    
    x=SubsDesc(A(:,1:length(b)),A(:,length(b)+1));
        
end

