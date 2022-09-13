%% ejercicio2. Arturo, Mario, Jorge
A = matriz_cuadrada();
b = vector(size(A, 1), 'b');
solComando=A\b';
display(solComando);
[u, A,r] = eliminacion_gaussiana(A, b);
if r~=0
    display(u);
end
    
  
