clear all
ha=0.01;
Ta=20;
h=2;
x=0+h;h:10-h;
n=length(x);
alpha=40;
beta=200;
f=zeros(n,1);
g=ha*ones(n,1);
q=-ha*Ta*ones(0,1);
a=-(h*f/2)-1;
b=h*h*g+2;
c=(h*f/2)-1;
d=-h*h*q;
z=[1:4]';
A=spdiags([a b c ],[-1 0 1 ],4,4);
full(A)
m=[1:4]';
B=d;
B(1)=d(1)-a(1)*alpha;
B(n)=d(n)-c(n)*beta;
Ti=A\B;
T=[alpha;Ti;beta]