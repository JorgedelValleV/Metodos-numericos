function [u, A,r] = cholesky(A, b)
n = size(A, 1);
r=1;
for i=1:n
    var = A(i,1:i-1) * A(i,1:i-1)';
    if A(i, i) <= var
         r = 0;
         u= zeros(n,1);
         disp('A no admite factorización de Cholesky.')
         return;
    end
    A(i, i) = sqrt(A(i, i) - var);
    for j = i+1:n
        A(j, i) = 1 / A(i,i) * (A(i, j) - A(i,1:i-1) * A(j,1:i-1)');
    end
end

%funcion del ejercicio1
for i=1:n
    w(i)=b(i);
   for j=1:(i-1)
       w(i)=w(i)-A(i,j)*w(j);
   end
    w(i)= w(i)/A(i,i);
end

%funcion del ejercicio1
for i=n:-1:1
    u(i)=w(i);
   for j=(n):-1:(i+1)
       u(i)=u(i)-A(i,j)*u(j);
   end
   u(i)= u(i)/A(i,i);
end

