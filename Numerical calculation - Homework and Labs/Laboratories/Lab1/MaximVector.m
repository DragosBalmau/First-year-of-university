function [NrMaxim,NrAparitii,Aparitii] = MaximVector(x)

    maxim=-9999999;
    nr=0;
    for i=1:length(x)
        if(x(i)>maxim)
            maxim=x(i);
            nr=1;
        elseif (x(i)==maxim)
            nr=nr+1;
        end
    end
    
    k=1;
    for i=1:length(x)
        if (x(i)==maxim)
            y(k)=i;
            k=k+1;
        end
    end    
    NrMaxim=maxim
    NrAparitii=nr
    Aparitii=y
end

