%Giai phuong trinh Laplace - PP lap:
clc;
clear all;

eps=1e-6;
h=0.5;
x=0:h:4;            y=0:h:4;
n=length(x);        m=length(y);  

omega=4/(2+sqrt(4-(cos(pi/(n-1))+cos(pi/(m-1)))^2));
u=zeros(n,m)
%dieu kien bien:
u(2:m-1,1)=80          
u(2:m-1,n)=0                     
u(m,2:n-1)=180        
u(1,2:n-1)=20
u(2:n-1,2:m-1)=70

t=1;
while (t>eps)
for j=2:n-1
    for i=2:m-1
        r(j,i)=(u(j+1,i)+u(j-1,i)+u(j,i-1)+u(j,i+1)-4*u(j,i))/4
        u(j,i)=u(j,i)+omega*r(j,i);
        t=r(j,i);  
    end
end
end

  u(1,1)=50;  
  u(1,n)=10;
  u(n,1)=130;
  u(n,n)=90;
 mesh(u)