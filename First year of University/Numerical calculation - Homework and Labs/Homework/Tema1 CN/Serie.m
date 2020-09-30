function [S] = Serie(n)

    Suma=0;
    for k=1:n
        Suma=Suma+(((-1)^k)*2^(3*k))/(9^k);
    end
    S=Suma;
end

