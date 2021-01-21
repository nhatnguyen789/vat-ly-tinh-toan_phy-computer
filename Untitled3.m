%FFT (Fast Fourier Transform)
clc; clear all;
fs=100;
t=0:(1/fs):(10-1/fs);
S=cos(2*pi*15*t);

n=length(S);
X=fft(S);
% f=(0:n-1)*(fs/n);
f=(0:n-1)*(fs/n);

power=abs(X).^2/n;
figure(1);
plot(f,power,'red')
grid on

Y=fftshift(X);
fshift=(-n/2:n/2-1)*(fs/n);
powershift=abs(Y).^2/n;
figure(2);
plot(fshift,powershift,'black')
%ginput(2) lay toa do
grid on