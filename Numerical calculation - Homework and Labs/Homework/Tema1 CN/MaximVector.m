function [y1,y2] = MaximVector(x)

    maxim=-9999999;
    nr=0;
    for i=1:length(x)
        if(x(i)>maxim)
            maxim=x(i);
            nr=1;
        elseif(x(i)==maxim)
            nr=nr+1;
        end
    end
    
    fprintf("Elementul maxim %d apare de %d ori in sir pe pozitiile: ",maxim,nr);
    for i=1:length(x)
        if(x(i)==maxim)
            fprintf("%d ",i)
        end
    end
end

