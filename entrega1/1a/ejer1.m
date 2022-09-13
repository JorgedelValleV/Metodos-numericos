%un sistema triangular inferior con unos en la diagona
Ma = [1,0,0;2,1,0;3,4,1];
b=[5,7,9];
for i=1:3
    sol1(i)=b(i);
   for j=1:(i-1)
       sol1(i)=sol1(i)-Ma(i,j)*sol1(j);
   end
end
display(sol1);
% un sistema triangular inferior arbitrario
Mb = [3,0,0;2,4,0;1,1,2];
b=[5,7,9];
for i=1:3
    sol2(i)=b(i);
   for j=1:(i-1)
       sol2(i)=sol2(i)-Mb(i,j)*sol2(j);
   end
   sol2(i)= sol2(i)/Mb(i,i);
end
display(sol2);
% un sistema triangular superior
Mc = [3,2,1;0,4,-1;0,0,-2];
b=[5,7,9];
for i=3:-1:1
    sol3(i)=b(i);
   for j=(n):-1:(i+1)
       sol3(i)=sol3(i)-Mc(i,j)*sol3(j);
   end
   sol3(i)= sol3(i)/Mc(i,i);
end
display(sol3);