function [y] = f(x)

    for i=1:length(x)

        if (x(i)<1)
            y(i)=2^(1/(x(i)-1));
        elseif (x(i)==1)
            y(i)=0;
        else
            y(i)=log(x(i)*x(i)-2*x(i)+2);
        end
    end
end

