clc;
clear all;
N=8;
W=exp(-2*1i*pi/N)
x=[1,1,1,1,0,0,0,0];
X=zeros(N,1);
pha=zeros(N,1);
for k=1:N
    X(k,1)=0;
    for n=1:N
      X(k,1)=X(k,1)  +  x(n)*W^((k-1)*(n-1));
      pha(k,1)=(atan2(imag(X(k,1)),real(X(k,1))))*180/pi;
    end
end
abs(X)
pha
KQ= [abs(X) pha]
% e=sqrt((real(X).^2)+imag(X).^2)