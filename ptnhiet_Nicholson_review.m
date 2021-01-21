clear all
close all
h=0.1;
k=0.01;
x=0:h:1;
t=0:k:0.1;
m=length(t);
n=length(x);
B=zeros(n-2,1);
c1=0;
c2=0;
c=1;
r=(k*c^2)/h^2;
a=-r;
b=2*(1+r);
u=zeros(m,n);
f=sin(pi*x)+sin(3*pi*x);
u(1,:)=f;
u(:,1)=0;
u(:,n)=0;
f(1)=u(1,1);
f(n)=u(1,n);
N=n-2;
duoi=a*(ones(N,1));
giua=b*(ones(N,1));
tren=c*(ones(N,1));
A=spdiags([duoi giua tren],[-1 0 1],N,N);
full(A)
for i=2:m
    for j=2:n-1
d(j-1)=r*(u(i-1,j-1))+2*(1-r)*u(i-1,j)+r*u(i-1,j+1);
    end 
    B(:)=d(:)
    B(1,1)=d(1)-duoi(1)*u(i,1);
B(N,1)=d(N)-tren(N)*u(i,n);
X=A\B
u(i,2:n-1)=X';
    
end
u
mesh(u)
    






