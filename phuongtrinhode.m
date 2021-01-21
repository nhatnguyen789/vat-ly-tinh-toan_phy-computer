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
    f=@(t,y)((-R/L)*y+(E/L));
    [t,y]=ode45(f,t,[0]);
    plot(t,y)
    hold on
end     