function [u, A,r] = tridiagonal(A, b)
n = size(A, 1);
r=1;

g= zeros(n,1);
m= zeros(n,1);
m(1)=A(1,1);
if m(1)==0
    disp('A no tiene todos los menores principales distintos de cero')
    r=0;
    u = zeros(n,1);
    return;
end
    
for i=2:n
    m(i)=A(i,i)-A(i-1,i)/m(i-1)*A(i,i-1);
    if m(i)==0
        disp('A no tiene todos los menores principales distintos de cero')
        r=0;
        u = zeros(n,1);
        return;
    end
end

g(1)=b(1)/m(1);
for i=2:n
   g(i)=(b(i)-g(i-1)*A(i,i-1))/m(i); 
end

u(n)=g(n);
for i=n-1:-1:1
   u(i)=g(i)-A(i,i+1)/m(i)*u(i+1); 
end


