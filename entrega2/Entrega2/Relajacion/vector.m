%% generacion de vectores
function b = vector(n)
    b = zeros(n, 1);
    for i = 1:n
        m = ['b(', num2str(i), '):'];
        b(i) = input(m);
    end
  
 end
