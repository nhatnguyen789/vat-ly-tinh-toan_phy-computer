clear all
close all
h=0.2;
k=0.02;
a=1;
b=0.2;
c=1;
c1=0;
c2=0;
t=0:k:b;
m=length(t);
x=0:h:a;
n=length(x);
r=c^2*k/h^2;
s1=1-2*r;
u=zeros(m,n);
f=ones(1,n);
for j=1:n
    f(j)=4*x(j)-4*x(j)^2;
end
u(1,2:n-1)=f(2:n-1);
u(:,1)=0;
u(:,n)=0;
f(1)=u(1,1);
f(n)=u(1,n);
for i=2:m
    for j=2:n-1
        u(i,j)=s1*u(i-1,j)+r*u(i-1,j-1)+u(i-1,j+1);
    end
end

u
mesh(u)
        


