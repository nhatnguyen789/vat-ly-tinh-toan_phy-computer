clear all
close all
Tu=200;
Ti=40;
h=2;
k=0.01;
x=2:h:8;
n=length(x)
L=10;
f=zeros(1,4);
g=k*ones(1,4);
q=-k*20*ones(1,4);

a=-((h*f)/2)-1;
b=(h^2)*g+2;
c=((h*f)/2)-1;
d=(-h^2)*q;

A=zeros(n,n);
A(1,1)=b(1);
A(1,2)=c(1);
A(n,n)=b(n);
A(n,n-1)=a(n);

B=zeros(n,1);
B(1,1)=d(1)-a(1)*Ti;
B(n,1)=d(n)-c(n)*Tu;
for i=2:n-1
    A(i,i-1)=a(i);
    A(i,i)=b(i);
    A(i,i+1)=c(i);
    B(i,1)=d(i);
end 
A
B
X=A\B
