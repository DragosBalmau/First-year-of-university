function [ y ] = F( x )


    for i=1:length(x)
        
        if (x(i) > -2 &  x(i) < 0)
            y(i)=x(i)*x(i);
        elseif(x(i) >= 0 & x(i) < 3)
            y(i)=x(i)*x(i)*x(i);
        elseif(x(i) >= 3 & x(i) < 4)
            y(i)=x(i)*x(i)+18;
        else
            y(i)=0;
        end   
    end
end

