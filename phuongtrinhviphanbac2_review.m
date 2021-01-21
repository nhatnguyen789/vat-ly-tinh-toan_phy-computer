clear all
h=0.01;
k=0.3;
m=1;
c=0.2;
t=0:0.01:70;
x(1)=1;
v(1)=0;
hamx=@(x,v) (v);
hamv=@(x,v)((-k/m)*x-(c/m)*v);
for i=1:length(t)-1
    k1=h*hamx(x(i),v(i));
    l1=h*hamv(x(i),v(i));
    
    k2=h*hamx(x(i)+k1/2, v(i)+l1/2);
    l2=h*hamv(x(i)+k1/2, v(i)+l1/2);
    
    k3=h*hamx(x(i)+k2/2, v(i)+l2/2);
    l3=h*hamv(x(i)+k2/2, v(i)+l2/2);
    
    k4=h*hamx(x(i)+k3, v(i)+l3);
    l4=h*hamv(x(i)+k3, v(i)+l3);
    
    x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    v(i+1)= v(i)+(1/6)*(l1+2*l2+2*l3+l4);
end
[x' v']
figure(1)
plot(t,x)
figure(2)
plot(t,v)
figure(3)
plot(t,x,t,v*3)