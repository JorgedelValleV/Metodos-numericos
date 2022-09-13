t = sprintf("Modo 0: funcion, modo 1: con valores");
mode = input(t);
while (mode ~=0 && mode ~=1)
    t = sprintf("Modo 0: funcion, modo 1: con valores");
    mode = input(t);
end

if mode == 1
    t = sprintf("numero de valores ");
    n = input(t);
    t = sprintf("valores de las coordenadas x: ",n);
    x = input(t);
    t = sprintf("valores de las coordenadas y: ",n);
    y = input(t);
else 
    t = sprintf("funcion a interpolar: ");
    f = input (t);
    t = sprintf("numero de valores ");
    n = input(t);
    t = sprintf("Puntos de interpolacion: ",n);
    x = input (t);
    y = [];
    for i = 1:n
        y(i) = f(x(i));
    end
end
n = n -1;
Mult = [1];
dif = [y];
P = [];
for i = 0:n
    P = [0 P] + Mult*dif(1);  %% formula rec de interp Newton
    Mult = [Mult 0] -[0 Mult*x(i+1)]; %% descomponiendo
    for j = 1:n-i
        dif(j) = (dif(j) - dif(j+1))/(x(j) - x(i+j+1));
    end
end

r = linspace(min(x), max(x), 100);
plot(r, polyval(P, r));
n = n+1;
hold on
if mode == 0
    plot(r, f(r));
end
plot(x,y,'r*');
hold off;


t = sprintf("1:mas puntos, 0: no");
b = input(t);
while (b~=0 && b~=1)
    t = sprintf("1:mas puntos, 0: no");
    b = input(t);
end


while (b == 1)
    if mode == 0
        t = sprintf("nuevo punto: ");
        nuevo = input(t);
        nuevo_y = f(nuevo);
    else
        t = sprintf("coordenada x del nuevo punto: ");
        nuevo = input(t);
        t = sprintf("coordenada y del nuevo punto: ");
        nuevo_y = input (t);
    end
    y = [y, nuevo_y];
    x = [x, nuevo];
    dif = [dif,nuevo_y];
    for i = n:-1:1
        dif(i) = (dif(i) - dif(i+1))/ (x(i) - x(n+1));
    end
    
    P = [0 P] + Mult*dif(1);
    Mult = [Mult 0] -[0 Mult*x(n+1)];
    n = n+1;
    r = linspace(min(x), max(x), 100);
    plot(r, polyval(P,r));
    hold on;
    if(mode == 0)
        plot(r,f(r));
    end
    plot(x, y, 'r*');
    hold off;
    t = sprintf("1:mas puntos, 0: no");
    b = input(t);
    while (b~=0 && b~=1)
    t = sprintf("1:mas puntos, 0: no");
    b = input(t);
    end
end


