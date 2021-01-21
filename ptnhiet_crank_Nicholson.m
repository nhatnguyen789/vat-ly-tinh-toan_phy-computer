clc; clear all;
%Giai pt truyen nhiet - Crank - Nicholson

c=1; h=0.1; k=0.01;
x=0:h:1;
t=0:k:0.1;
n=length(x);
m=length(t);
r=(k*c^2)/h^2;  a=-1; c=-1;
b=(2/r)+2;

u=zeros(m,n);
%dieu kien dau
f=sin(pi*x)+sin(3*pi*x);
%dieu kien bien:
u(:,1)=0;
u(:,n)=0;
u(1,2:n-1)=f(2:n-1);

N=n-2;
am=a*(ones(N,1))
bm=b*(ones(N,1))
cm=c*(ones(N,1))

A=spdiags([am bm cm],[-1 0 1],N,N)

for j=2:m
    for i=2:n-1
        d(i-1)=u(j-1,i-1)+((2/r)-2)*u(j-1,i)+u(j-1,i+1);
    end
B=d;
B(1)=B(1)-am(1)*u(j,1);

B(N)=B(N)-cm(N)*u(j,n);
X=A\B';
u(j,2:n-1)=X;
end
u
mesh(u)
