clear all
close all
Tu=-0.95;
Ti=1.25;
h=0.2;
t=h:h:4-h;
n=length(t);
f=2*t./(1+t.^(2));
g=-2./(1+t.^(2));
q=ones(1,n);
a=((-h*f)/2)-1;
b=(h*h)*g+2;
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
