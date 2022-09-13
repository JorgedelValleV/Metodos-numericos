M = [0,1,2,1;1,2,1,3;1,1,-1,1;0,1,8,12];
b = [1,0,5,2];
punt = [1,2,3,4];
n = 4; %el tamaño de la matriz
solComando=M\b';
display(solComando);
for j=1:(n-1)
    %metodo del pivote parcial
    max = M(punt(j),j);
    for i=(j+1):n
       if abs(max) < abs(M(punt(i),j)) 
           max = M(punt(i),j);
           index=i;
       end
    end
    if  max ~= M(punt(j),j)
        aux=punt(index);
        punt(index)=punt(j);
        punt(j)=aux;
    end
    for i=(j+1):n
         m = -M(punt(i),j)/M(punt(j),j);
         M(punt(i),j)=-m;
         for k=(j+1):n
             M(punt(i),k)=m*M(punt(j),k) + M(punt(i),k); 
         end
    end
end

w(1)=b(punt(1));
for i=2:n
   w(i)=b(punt(i));
   for j=1:(i-1)
      w(i)=w(i)-M(punt(i),j)*w(j); 
   end
end

u(n)=w(n)/M(punt(n),n);
for i=n-1:-1:1
   u(i)=w(i);
   for j=i+1:n
      u(i)=u(i)-M(punt(i),j)*u(j); 
   end
   u(i)=u(i)/M(punt(i),i);
end

solAlgoritmo=u;
display(solAlgoritmo);