%% Arturo, Jorge, Mario
A = matriz_cuadrada();
b = vector(size(A, 1));
maxiter = input('di numero maximo de iteraciones :');
precision = input('di precision para el test de parada :');
[u,s,k] = Jacobi(A,b,maxiter,precision);
if s==1
    str=['Se ha alcanzado la solucion en la iteracion numero :', num2str(k)];
    disp(str);
    disp('La solucion calculada es u: ');
    disp(u);
end

