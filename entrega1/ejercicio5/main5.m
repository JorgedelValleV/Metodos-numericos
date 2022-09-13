%% main ejercicio 5 
%% Arturo, Jorge, Mario
A = matriz_cuadrada();
b = vector(size(A, 1), 'b');
C=A;
r= 1;
[u,A,r] = cholesky(A, b);
if(r~=0)
    display(u);
    B=chol(C);
    solComando= B\(B'\b)
    display(solComando);
end

    