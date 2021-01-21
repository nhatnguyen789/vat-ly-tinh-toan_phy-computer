clear all
k=0.3;
m=1;
c=0.02;
h=0.01;
t=0:0.01:70;
x(1)=1;
v(1)=0;
z=[x v]
hamxv=@(t,z)([ z(2);(-k/m)*z(1)-(c/m)*z(2)]);
[t,y]=ode45(hamxv,t,[1 0]);
figure(1)
plot(t,y(:,1));
figure(2)
plot(t,y(:,2));
figure(3)
plot(t,y(:,1),t,y(:,2)*3);