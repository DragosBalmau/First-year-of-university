%%Problema #1 V2
fprintf("Problema #1\n\n")

fprintf("Pentru a=1,b=5,c=6:\n")
Ecuatiedegr2(1,-5,6);
fprintf("Pentru a=1,b=-4,c=4:\n")
Ecuatiedegr2(1,-4,4);
fprintf("Pentru a=1,b=-4,c=5:\n")
Ecuatiedegr2(1,-4,5);


fprintf("\n\n")
%%Problema #2 V2
fprintf("Problema #2\n\n")

a=-2;
b=2;

fprintf("f(a) = %f\n",f(a))
fprintf("f(b) = %f",f(b))

xmin=-1;
xmax=3;

x=linspace(xmin,xmax,100);
y=f(x);
plot(x,y,'Linewidth',3)
xlabel('x','FontAngle','italic', 'FontName','Monotype Corsiva','FontSize',20,'Color','k')
ylabel('y','FontAngle','italic', 'FontName','Monotype Corsiva','FontSize',20,'Color','k')
title('Functie definita pe ramuri','FontAngle','italic', 'FontName','Arial','FontSize',10,'Color','k')
grid on
legend('f', 'Location', 'North')
fprintf("\n\n")

%%Problema #3 V2
fprintf("Problema #3\n\n")

a=[-5,-4,8,3,8,-6,0,8,2,0];

MaximVector(a)

fprintf("\n\n")
%%Problema #4 V2
fprintf("Problema #4\n\n")

a=[3,4,5,6,7];

fprintf("b = ")

for i=1:length(a)

    b(i)=a(length(a)-i+1);
    fprintf("%d ",b(i))
    
end
fprintf("\n\n")

%%Problema #5 V2
fprintf("Problema #5\n\n")
fprintf("S10 = %f\n",Serie(10))
fprintf("S20 = %f\n",Serie(20))
fprintf("S30 = %f\n\n",Serie(30))

S=-8/17;

fprintf("ea(S10) = %f\n",EroareAbs(S,Serie(10)))
fprintf("ea(S20) = %f\n",EroareAbs(S,Serie(20)))
fprintf("ea(S30) = %f\n\n",EroareAbs(S,Serie(30)))

fprintf("er(S10) = %f la suta\n",EroareRel(S,Serie(10))*100)
fprintf("er(S20) = %f la suta\n",EroareRel(S,Serie(20))*100)
fprintf("er(S30) = %f la suta\n",EroareRel(S,Serie(30))*100)

%Pentru cerinta d nu intelg clar ce mi se cere pentru ca sunt o infinitate
%de valori pentru nmin, dar daca va referiti la cea mai mica valoare
%pentru nmin cat mai apropiata de 3% este chiar 30
fprintf("\ner(S30) = %f la suta < 3 la suta\n",EroareRel(S,Serie(30))*100)

