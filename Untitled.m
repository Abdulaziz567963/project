clear all;
close all;
clc;
f1=50;
f2=2*f1;
f3=3*f1;
ts=1/(f3*100);
N=500;
t=(0:N)*4*ts;
N=size(t,2);
xt1=sin(2*pi*f1*t);
xt2=0.5*sin(2*pi*f2*t);
xt3=0.333*sin(2*pi*f3*t);
%input signal x(t)
xt=xt1+xt2+xt3;
figure(1)
plot(t,xt)
title(' input signal ')
p=4; %Number of Synapses
x=convmtx(xt,p);
x=x(:,1:N);
d=xt1; %the target signal is equal
y=zeros(size(d)); %memory allocation for y
eps=zeros(size(d)); %memory allocation for eps
eta=0.4; %learning rate/gain
w=rand(1,p); %intializing of the weight vector
for epock=1:50
for n=1:N %learning loop
y(n)=w*x(:,n); %predicated output signal
my_eps(n)= d(n)-y(n); %error signal

w=w+eta*my_eps(n)*x(:,n)';
end
end
figure(2)
plot(t,d,'b',t,y,'r'),grid,
title('target blue and predicated sigals red'),
xlabel('time[sec]')
figure(3)
plot(t,my_eps),grid,title('predication error'),xlabel('time[sec]')