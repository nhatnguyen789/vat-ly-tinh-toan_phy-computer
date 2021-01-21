clear all
Ta=20;
ha=0.01;
h=0.2;
x=0+h:h:10-h;
n=length(x)
alpha=40;
beta=200;
f=zeros(n,1);
g=ha*ones(n,1);
q=-ha*Ta*ones(n,1);
a=-(h*f/2)-1;
b=h*h*q;
c=(h*f/2)-1;
d=-h*h*q;
z=zeros(4,4);
for i=1:n
    z(i,1)=b(i);
    if i<n
        z(i,i+1)=a(i+1);
        z(i+1,i)=c(i);
    end
end
d(1)=d(1)-a(1)*alpha;
d(n)=d(n)-c(n)*beta;
Ti=z\d;
T=[alpha;Ti;beta]