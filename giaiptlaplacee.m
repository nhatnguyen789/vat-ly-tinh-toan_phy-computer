%Giai phuong trinh Laplace:
clc;
clear all;
h=0.25;
x=0:h:5;
y=0:h:5;
n=length(x);    nx=n-2;
m=length(y);    ny=m-2;
u=zeros(n,m)
%dieu kien bien:
u(2:m-1,1)=80
u(2:m-1,n)=0
u(1,2:n-1)=180
u(m,2:n-1)=20
%______________________________________________________
%Tao ma tran A
N=(n*m)-2*n-2*(n-2) %(nx*ny)
one=ones(N,1)
mid=-4*ones(N,1)

onespb=ones(N,1);    %dong 1 dac biet duoi
onespb(nx:nx:N,1)=0;

onespt=ones(N,1);   %dong 1 dac biet tren
onespt(1:nx:N,1)=0;

A=spdiags([one onespb mid onespt one],[-nx -1 0 1 nx],N,N);

%______________________________________________________
%Tao ma tran B:

%Tao 2 duong doc thu 2 va ke cuoi:
u(2,2:n-1)=-u(1,2:n-1);
u(m-1,2:n-1)=-u(m,2:n-1);

%Tao 2 duong ngang thu 2 va ke cuoi: (co tinh toan tai cac diem thay doi
%gia tri:
u(2:m-1,2)=u(2:m-1,2)-u(2:m-1,1);
u(2:m-1,n-1)=u(2:m-1,n-1)-u(2:m-1,n);

%Thay lan luot cac diem vao ma tran B:
k=1;
for i=(m-1):-1:2
    for j=2:(n-1) 
        B(k,1)=u(i,j);
        k=k+1;
    end
end

full(A)
B
KQ=A\B

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

%CACH 2: Cach cua Thay:
% i=2;
% k=0;
% for j=2:n-1
%     k=k+1;
%     b(k)=-u(i-1,j);
%     if (j==2)
%         b(k)=b(k)-u(i,j-1);
%     elseif (j==n-1)
%         b(k)=b(k)-u(i,j+1);
%     end
% end
% 
% for i=3:m-2
%     for j=2:n-1
%         k=k+1;
%         b(k)=0;
%         if (j==2)
%             b(k)=b(k)-u(i,j-1);
%         else (j==n-1)
%             b(k)=b(k)-u(i,j+1);
%         end
%     end
% end
% 
% i=m-1
% for j=2:n-1
%     k=k+1;
%     b(k)=-u(j,i)
%     if (j==2)
%         b(k)=b(k)-u(i,j-1)
%     elseif (j==n-1)
%         b(k)=b(k)-u(i,j+1);
%     end
% end
%     