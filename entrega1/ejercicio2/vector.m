%% generacion de vectores
function v = vector(n, u)
    v = zeros(n, 1);
    for i = 1:n
        m = [u, '(', num2str(i), '):'];
        v(i) = input(m);
    end
  
 end
