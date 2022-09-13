function [u, A,r] = eliminacion_gaussiana(A, b)
%% sabemos que la matriz es cuadrada y b tiene su misma dimension
n=size(A,1);
punt = 1:n;
r=1;
for j=1:(n-1)
    %metodo del pivote parcial
    max = A(punt(j),j);
    for i=(j+1):n
       if abs(max) < abs(A(punt(i),j)) 
           max = A(punt(i),j);
           index=i;
       end
    end
    if max == 0
        u = zeros(n, 1);
        r=0;
        disp('A no inversible')
        return;
    end
    if  max ~= A(punt(j),j)
        aux=punt(index);
        punt(index)=punt(j);
        punt(j)=aux;
    end
    for i=(j+1):n
         m = -A(punt(i),j)/A(punt(j),j);
         A(punt(i),j)=-m;
         for k=(j+1):n
             A(punt(i),k)=m*A(punt(j),k) + A(punt(i),k); 
         end
    end
end
    if A(punt(n), n) == 0 
            zeros(n, 1);
            r=0;
            disp('A no es inversible.')
            return;
    end
w(1)=b(punt(1));
for i=2:n
   w(i)=b(punt(i));
   for j=1:(i-1)
      w(i)=w(i)-A(punt(i),j)*w(j); 
   end
end

u(n)=w(n)/A(punt(n),n);
for i=n-1:-1:1
   u(i)=w(i);
   for j=i+1:n
      u(i)=u(i)-A(punt(i),j)*u(j); 
   end
   u(i)=u(i)/A(punt(i),i);
end

