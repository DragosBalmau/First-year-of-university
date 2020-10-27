function [ r ] = NR( f,df,x0,E )


    x(1)=x0;
    k=2;
    while 1
        x(k)=x(k-1)-f(x(k-1))/df(x(k-1));
        if abs(x(k)-x(k-1))/abs(x(k-1))<E;
            break
        end
        k=k+1;
    end
    r=x(k);

end

