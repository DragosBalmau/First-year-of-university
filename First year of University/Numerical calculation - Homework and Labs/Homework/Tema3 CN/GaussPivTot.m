function [x,z] = GaussPivTot(A, b)
  
  if(nargin==2)
    A = [A, b];
  end
  schimbariLsauC=0;
  n = size(A, 1);
  xi = 1:n;
  for k = 1 : n - 1
    p=k;
    m=k;
    for i = k : n
      for j = k : n
        if abs(A(i, j)) > abs(A(p, m))
          p=i;
          m=j;
        end 
      end 
    end 
    if A(p,m) == 0
      disp('Sistem incompatibil sau sistem compatibil nedeterminat');
      return;
    end 
    
    if (p~=k)
      A([p,k], :) = A([k,p], :);
      schimbariLsauC=schimbariLsauC+1;
    end 
    
    if (m~=k)
      A(:,[m,k])=A(:,[k,m]);
      xi([m,k])=xi([k,m]);
      schimbariLsauC=schimbariLsauC+1;
    end 
    
    for l=k+1:n
      A(l, :)=A(l, :)-((A(l,k)/A(k,k))*A(k, :));
    end 
  end 
  
  if(nargin==2)%pentru varianta de rezolvare a sistemului normal
    if A(n,n)==0
        disp('Sistem incompatibil sau sistem compatibil nedeterminat');
        return;
    end
    y = SubsDesc(A(1: n, 1: n), A(:, n + 1));
  
    for i = 1: n
        x(xi(i)) = y(i);
    end
  else 
      x=A;
      z=schimbariLsauC;
  end 
end