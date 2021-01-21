%PT_song cua mot soi day dao dong_PP sai phan:
clc; clear all;
h=0.1;      k=0.05;     c=2;      a=1;        b=0.5;

r=c*(k/h);
x=0:h:a;
t=0:k:b;
n=length(x);
m=length(t);

r2=r*r;
s1=1-r2;
s2=2-2*r2;

f=sin(pi*x)+sin(2*pi*x);
g=zeros(m,n);
u=zeros(m,n);

u(:,1)=0;  
u(:,n)=0;
u(1,2:n-1)=f(2:n-1);


for j=2:n-1
u(2,j)=s1*f(j)+g(j)*k+1/2*r2*(f(j-1)+f(j+1))
end

for i=2:m-1
    for j=2:n-1
        u(i+1,j)=s2*u(i,j)+r2*(u(i,j-1)+u(i,j+1))-u(i-1,j)
    end
end

mesh(u) 
%plot3(t,u,x)
grid on