M = [-1,1,0,0;1,2,1,0;0,1,-1,1;0,0,8,12];
d=[1,0,2,5];
n=4; %tamaño de la matriz

solComando=M\d';
display(solComando);

m(1)=M(1,1);
for i=2:n
    m(i)=M(i,i)-M(i-1,i)/m(i-1)*M(i,i-1);
end

g(1)=d(1)/m(1);
for i=2:n
   g(i)=(d(i)-g(i-1)*M(i,i-1))/m(i); 
end

x(n)=g(n);
for i=n-1:-1:1
   x(i)=g(i)-M(i,i+1)/m(i)*x(i+1); 
end

solAlgoritmo=x;
display(solAlgoritmo);
