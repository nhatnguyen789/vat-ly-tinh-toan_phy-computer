clear all
E=1;
h=0.00005;
t=0:h:0.05;
y(1)=0;
L=0.25;
r=[30 50 70 90 110]  
n=length(t)
m=length(r)
for j=1:m
    R=r(j)
    f=@(y)(-R/L*y+E/L);
    for i=1:n-1;
        k1=h*f(y(i));
        k2=h*f(y(i)+k1/2);
        k3=h*f(y(i)+k2/2);
        k4=h*f(y(i)+k3);
        y(i+1)=y(i)+(1/6)*(k1+2*k2+2*k3+k4);
    end
    plot(t,y)
    hold on
end   