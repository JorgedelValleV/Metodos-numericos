%% lu
function [u, A,r] = factorizacion_LU(A, b)
    n = size(A, 1);
    
for i=1:n
    A(i, i) = A(i, i) - A(i, 1:i-1) * A(1:i-1, i);
        if A(i, i) == 0
            r = 0;
            u = zeros(n,1);
            disp('A no admite factorización LU.')
            return;
        end
    for j=i+1:n
        A(i, j) = A(i, j) - A(i, 1:i-1) * A(1:i-1, j);
    end
    for j=i+1:n
        A(j, i) = 1/A(i, i) * (A(j, i) - A(j, 1:i-1) * A(1:i-1, i));
    end
end

%funcion del ejercicio1
for i=1:n
    w(i)=b(i);
   for j=1:(i-1)
       w(i)=w(i)-A(i,j)*w(j);
   end
end

%funcion del ejercicio1
for i=n:-1:1
    u(i)=w(i);
   for j=(n):-1:(i+1)
       u(i)=u(i)-A(i,j)*u(j);
   end
   u(i)= u(i)/A(i,i);
end

