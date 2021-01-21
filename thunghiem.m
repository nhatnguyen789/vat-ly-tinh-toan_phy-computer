%BT giai phuong trinh vi phan BAC 2:
% x''=(2t/(1+t^2)).x' - (2/(1+t^2)).x + 1
clear all;
clc;
%?e bài cho:
h=0.2;
t=0+h:h:4-h;
n=length(t);
%________________
%Xu ly và nhap lieu:
for j=1:n;
 f(j)=2*t(j)/(1+t(j)*t(j));
 g(j)=-(2/(1+t(j)*t(j)));
 q(j)=1;
end

a=-(h/2)*f-1
b=h^2*g+2
c=h/2*f-1
d=-h^2*q
%Thành lap ma tran chéo:
%__________________________
%   Tao ma tran thu cong:
% A(1,1)=b(1);  A(1,2)=c(1);     
% A(n,n-1)=a(n);  A(n,n)=b(n);
% 
%  for i=2:n-1   
%      A(i,i-1)=a(i);  
%      A(i,i)=b(i);   
%      A(i,i+1)=c(i);
%  end
%__________________________
% tao ma tran bang function spdiags
am=[a(2:n) 0]
cm=[0 c(1:n-1)]
A=full(spdiags([am' b' cm'],[-1 0 1],n,n))
B=d';
B(1)=B(1)-a(1)*1.25;
B(n)=B(n)-c(n)*(-0.95);
%__________________________
A
T=A\B;
KQ=[t' T]