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
tren=[0 c(1:n-1)]';
giua=b';
duoi=[a(2:n) 0]';
    A=spdiags([duoi giua tren],[-1 0 1],n,n);
    full(A)
    B(1,1)=d(1)-a(1)*Ti;
    B(n,1)=d(n)-c(n)*Tu;
    for i=2:n-1
        B(i,1)=d(i);
    end
    X=A\B
    plot(t,X)
    
    
   