clc; clear all;
%Giai pt truyen nhiet - sai phan

c=1; h=0.2; k=0.02;
x=0:h:1;
t=0:k:0.2;
n=length(x);
m=length(t);
r=(k*c^2)/h^2;

u=zeros(m,n);
%dieu kien dau
f=4*x-4*x.^2;
%dieu kien bien:
u(:,1)=0;
u(:,n)=0;
u(1,2:n-1)=f(2:n-1);

for j=1:m-1
    for i=2:n-1
       u(j+1,i)=r*u(j,i-1)+(1-2*r)*u(j,i)+r*u(j,i+1)
    end
end

mesh(u)