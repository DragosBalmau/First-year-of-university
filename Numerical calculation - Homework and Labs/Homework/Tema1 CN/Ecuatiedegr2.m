function [x1,x2] = Ecuatiedegr2(a,b,c)

    delta=b*b-4*a*c;
    x1=(-b+sqrt(delta))/(2*a)
    x2=(-b-sqrt(delta))/(2*a)

end

