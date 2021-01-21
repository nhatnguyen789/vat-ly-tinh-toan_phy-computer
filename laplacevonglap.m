clear all
close all
clc
h=0.5;
k=h;
x=0:h:4;
y=0:h:4;
m=length(y);
n=length(x);
eps=1e-6;  
can=sqrt(4-(cos(pi/(n-1))+cos(pi/(m-1)))^2);
omega=4/(2+can)

u(1,2:m-1)=20;
u(n,2:m-1)=180;
u(:,1)=80;
u(:,m)=0;
er=1
while(er>eps)
    for i=2:m-1
        for j=2:n-1
            r=(u(i,j-1)+u(i,j+1)+u(i-1,j)+u(i+1,j)-4*u(i,j))/4;
            u(i,j)=u(i,j)+omega*r;
            er=abs(r);
        end 
    end
end
u
    mesh(u)
    
    
    



