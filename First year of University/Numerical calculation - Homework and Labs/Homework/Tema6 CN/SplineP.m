function [y,z] = SplineP(X,Y,x,fpa)

    poz = 0;
    b(1) = fpa;
    n = length(X) - 1;

    for j=1:n
        a(j)=Y(j);
        h(j)=X(j+1)-X(j);
    end

    for j=1:n-1
        
        b(j+1)=(2/h(j))*(Y(j+1)-Y(j))-b(j);
        c(j)=1/h(j)^2*(Y(j+1)-Y(j)-h(j)*b(j));
      
        for k=1:length(x)
            if (x(k)>=X(j)) & (x(k)<=X(j+1))
                poz=j;
                break;
            end
        end
        
        y(k)=a(poz)+b(poz)*(x(k)-X(poz))+c(poz)*(x(k)-X(poz))^2;
        z(k)=b(poz)+2*c(poz)*(x(k)-X(poz)); 
        
    end
end