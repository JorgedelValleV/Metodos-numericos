M=[1,2,1,3;1,1,1,4;2,1,4,10;-1,-3,7,5];
b=[45,48,101,-4];
n=4;
[L,U]=lu(M);

for i=1:n
    for j=i:n
        for k=1:i-1
           M(i,j)=M(i,j)-M(i,k)*M(k,j); 
        end
    end
    for j=i+1:n
        for k=1:i-1
               M(j,i)=M(j,i)-M(j,k)*M(k,i); 
        end
        M(j,i)=M(j,i)/M(i,i);
    end
end

%funcion del ejercicio1
for i=1:n
    w(i)=b(i);
   for j=1:(i-1)
       w(i)=w(i)-M(i,j)*w(j);
   end
end

%funcion del ejercicio1
for i=n:-1:1
    u(i)=w(i);
   for j=(n):-1:(i+1)
       u(i)=u(i)-M(i,j)*u(j);
   end
   u(i)= u(i)/M(i,i);
end

solComando=U\(L\b');
solAlgoritmo=u;

display(solComando);
display(solAlgoritmo);