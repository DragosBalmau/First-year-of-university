function [x, L] = FactCholesky(A, b)
    
    n = length(b);
  
    %Initializam matricea L cu 0 pe toate pozitiile si suprascriem doar unde
    %este necesar
  
    L = zeros(n);

    alpha=A(1,1);
    if alpha <= 0
        error("A nu este pozitiv definita");
    end
  
    L(1, 1) = sqrt(A(1, 1));
    for i = 2 : n
        L(i, 1) = A(i, 1) / L(1, 1);
    end
  
    for k = 2 : n
        suma = 0;
        for s = 1 : (k - 1)
            suma = suma + L(k, s) ^ 2;
        end
        alpha = A(k, k) - suma;
        if alpha <= 0
            error("A nu este pozitiv definita");
        end
        L(k, k) = sqrt(alpha);
        for i = (k + 1) : n
            suma = 0;
            for s = 1 : (k - 1)
                suma = suma + L(i, s) * L(k, s);
            end
            L(i, k) = (1 / L(k, k)) * (A(i, k) - suma);
        end
    end
    
    y = SubsAsc(L, b);
    x = SubsDesc(L', y);
  
end