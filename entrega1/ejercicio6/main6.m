%% main ejercicio 6
%% Arturo, Jorge, Mario
A = matriz_cuadrada();
b = vector(size(A, 1), 'b');
r=1;
[u,A,r] = tridiagonal(A, b);
if(r~=0)
    display(u);
end
    