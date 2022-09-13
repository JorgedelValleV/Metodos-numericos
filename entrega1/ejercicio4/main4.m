%% main ejercicio 4 
%% Arturo, Jorge, Mario
A = matriz_cuadrada();
b = vector(size(A, 1), 'b');

[L,U]=lu(A);


[u, M,r] = factorizacion_LU(A, b);
if r~=0
    solComando=U\(L\b');
    display(solComando);
    display(u);
end
    
  