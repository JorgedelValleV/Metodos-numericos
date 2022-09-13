%Relajacion
function [u,s,k] = Relajacion(A,b,w,maxiter,precision)
    s = 1;
    m=maxiter;
    u=zeros(size(A,1),1);
    for k=1:m
        x(k)=k;
        for i=1:size(A,1)
            r(i) = b(i) - A(i,1:i-1)*u(1:i-1) - A(i,i:size(A,1))*u(i:size(A,1));
            d(i)=w*r(i)/A(i,i);
            u(i)=u(i)+d(i);
        end
        y(k)=norm(r)/norm(b);
        if  y(k)< precision
                plot(x,y)
                return;
        end
    end
    plot(x,y)
    disp('El numero maximo de iteraciones se ha alcanzado');
    s = 0;
end