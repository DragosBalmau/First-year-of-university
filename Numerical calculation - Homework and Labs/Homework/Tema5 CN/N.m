function [y] = N(X, Y, x)

    
    n = length(X);
    A = zeros(n, n);
    A(:, 1) = 1;
    
    for i = 2:n
        for j = 2:i
            P = 1;
            for k = 1:(j-1)
                P = P*(X(i)-X(k));
            end
            A(i, j) = P;
        end
    end
    
    c = SubsAsc(A, Y);
  
    y = c(1);
    for i = 2:n
        P = 1;
        for j=1:(i-1)
           P = P .*(x-X(j));
        end
        y = y + c(i)*P;
    end 
end