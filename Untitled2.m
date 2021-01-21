clear all;
close all;
k=0.3;
m=1;
c=0.2;
h=0.2;
t=0:h:1;
x(1)=6;
v(1)=4;
% hamx=@(v)(v);
% hamv=@(x,v)((-k/m)*x-(c/m)*v);
w(1)=x;
w(2)=v;
hamxv=@(t,w)([w(1)+2*w(2);3*w(1)+2*w(2)]);
[t1,y]=ode45(hamxv,t,[6,4])
plot(t1,y(:,1),t1,y(:,2))