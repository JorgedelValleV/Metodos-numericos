%Jacobi
function [u,s,k] = Jacobi(A,b,maxiter,precision)
    s = 1;
    m=maxiter;
    u=zeros(size(A,1),1);
    for k=1:m
        x(k)=k;
        r = b - A*u;
        y(k)=norm(r)/norm(b);
        if  y(k)< precision
            plot(x,y)
            return;
        end
        d = r./diag(A);
        u=u+d;
    end
    plot(x,y)
    disp('El numero maximo de iteraciones se ha alcanzado');
    s = 0;
end