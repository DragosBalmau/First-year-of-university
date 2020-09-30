function [y] = NDD(X,Y,x)

    n = length(X) - 1;
    Q(1:n+1,1) = Y(1:n+1);
    for i = 2 : n+1
        for j = 2 : i
            Q(i,j) = (Q(i,j - 1) - Q(i - 1,j - 1))/(X(i)-X(i-j+1));
        end
    end
    
    
    for i = 1 : length(x)
        Pn = Q(1,1);
        for k = 2 : n+1
            prod=1;
            for j = 1 : k-1
                prod = prod * (x(i) - X(j));
            end
            prod = prod * Q(k,k);
            Pn = Pn + prod;
        end
        y(i) = Pn;
    end
    
end




