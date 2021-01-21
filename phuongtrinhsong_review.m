clear all 
close all
%giai phýõng tr?nh sóng 
a=1;
b=0.5;
c=2;
h=0.1;
k=0.05;
r=1;
x=0:0.1:1;
t=0:0.05:0.5;
m=length(t)
n=length(x)
r=(c*k)/h;

f=sin(pi*x)+sin(2*pi*x);
r2=r*r;
s1=1-r2;
s2=2-2*r2;

u(:,1)=0;
u(:,n)=0;
u(1,2:n-1)=f(2:n-1)
g=zeros(m,n);
u=zeros(m,n);  
for j=2:n-1
    u(2,j)=s1*f(j)+k*g(j)+(1/2)*r2*(f(j-1)+f(j+1))
end
for i=2:m-1
    for j=2:n-1
        u(i+1,j)=s2*u(i,j)+r2*(u(i,j-1)+u(i,j+1))-u(i-1,j);
    end
end 

u(:,1)=t;
u
mesh(u)
%plot(t,u,x)
        
    

