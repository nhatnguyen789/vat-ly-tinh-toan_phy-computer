%BT1
t=0:0.001:0.25;   x=sin(2*pi*50*t)+sin(2*pi*120*t);
N=length(t);
y=x+1*randn(size(t));
figure(1);
plot(y(1:50),'red'); title('Noisy time domain signal');
grid on

%Tinh PSD va ve 126 diem dau, phan con lai doi xung:
Y=fft(y); Pyy=Y.*conj(Y)/N;
f=1000/N*(0:N-1);
figure(2);
plot(f,Pyy,'black');
title('Power spectral density');    xlabel('Frequency (Hz)');
grid on

%Ve trong khoang nho hon 200Hz:
figure(3);
plot(f(1:50),Pyy(1:50),'black');
title('Power spectral density');    xlabel('Frequency (Hz)');
grid on

%tim tan so cac song trong pho
[pow,pos]=sort(Pyy); %xep tu nho den lon: gia tri pho va index
m=4;                 %song co 2 tan so, moi tan so cho 2 dinh pho
K=length(Pyy);
h=pos(K-m+1:K);       %cho so chi dinh pho
X=abs(pow(h));       %gia tri dinh pho
F=fft(h);             %tan so dinh pho

XEM=[f(h)' Pyy(h)']     %f la tan so, Pyy la bien do tuong ung