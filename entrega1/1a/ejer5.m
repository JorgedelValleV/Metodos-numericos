M=[1,-1,1,0;-1,2,-1,2;1,-1,5,2;0,2,2,6];
b=[4,-3,16,8];
n=4;

B=chol(M);

for i=1:n
    for k=1:i-1
    M(i,i)=M(i,i)-M(i,k)^2;
    end
    M(i,i)=sqrt(M(i,i));
    for j=i+1:n
        for k=1:i-1
        M(j,i)=M(i,j)-M(i,k)*M(j,k);
        end
        M(j,i)=M(j,i)/M(i,i);
        M(i,j)=M(j,i);
    end
end

%funcion del ejercicio1
for i=1:n
    w(i)=b(i);
   for j=1:(i-1)
       w(i)=w(i)-M(i,j)*w(j);
   end
    w(i)= w(i)/M(i,i);
end

%funcion del ejercicio1
for i=n:-1:1
    u(i)=w(i);
   for j=(n):-1:(i+1)
       u(i)=u(i)-M(i,j)*u(j);
   end
   u(i)= u(i)/M(i,i);
end

solComando=B\(B'\b');
solAlgoritmo=u;
display(solComando);
display(solAlgoritmo);