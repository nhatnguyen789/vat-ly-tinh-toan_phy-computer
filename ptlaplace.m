clear all
close all
clc
h=0.25;
x=0:h:5;
y=0:h:5;
m=length(x);
n=length(y);
nx=3;
ny=3;
N=nx*ny;

u(2:m-1,1)=80;
u(2:m-1,n)=0;
u(1,2:n-1)=180;
u(m,2:n-1)=20;
A=zeros(9,9);

cheo=(-4)*ones(9,1);
duoi=ones(9,1);
tren=ones(9,1);
le=ones(9,1);
for i=nx:nx:9
    duoi(i)=0;
end
for i=nx+1:nx:9
    tren(i)=0;
end
A=spdiags([le duoi cheo tren le],[-nx -1 0 1 nx],9,9);

k=0;
i=2;
for j=2:n-1
k=k+1;
b(k)=-u(i-1,j);
   if(j==2)
    b(k)=b(k)-u(i,j-1);
   end
    if(j==n-1)
        b(k)=b(k)-u(i,j+1);
    end  
end

for i=3:m-2
for j=2:n-1
    k=k+1;
    b(k)=0;
    if(j==2)
    b(k)=b(k)-u(i,j-1);
    end
    if(j==n-1)
        b(k)=b(k)-u(i,j+1);
    end  
    
end
end
i=m-1
 for j=2:n-1
     k=k+1;
     b(k)=-u(j,i);
     if (j==2)
         b(k)=b(k)-u(i,j-1);
     end
     if (j==n-1)
         b(k)=b(k)-u(i,j+1);
     end
 end
 full(A)
 b
 KQ=A\b

k=1;
for i=(m-1):-1:2
    for j=2:(n-1) 
        u(i,j)=KQ(k,1);
        k=k+1;
    end
end
u(1,1)=180;
u(n,1)=20;
mesh(u)
 
    







