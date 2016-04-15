 %Linear Trendline

clear
clc
close all

T=[375 395 420 450 500];
P=[2.2 2.3 2.5 2.6 2.9];

figure('color','white')
subplot(2,2,1)
plot(T,P,'bo','MarkerSize',14,'MarkerFaceColor','blue')
axis([350 500 2 3])
xlabel('Temperature (T) [K]')
ylabel('Pressure (P) [atm]')
title('Plot of Temperature vs. Pressure')
grid on

C=polyfit(T,P,1);
m=C(1);
b=C(2);

%Sets linear spacing for points

xpf=linspace(min(T),max(T),100);
ypf=m*xpf+b;

hold on
plot(xpf,ypf,'--r','LineWidth',3)

%Create an equation line

TE=sprintf('P = %0.3f T + %0.1f',m,b);
text(460,2.55,TE,'BackgroundColor','white','EdgeColor','b','Color','b')

%To make text placement dependent on a point:
%text(T(2)+3,P(2)-0.1,TE)

%POWER EQUATIONS

%Remove clear for subplot)

R=[0.5 1 1.25 1.5 2];
V=[3 13 20 28 50];

%figure('color','white') (commented out for subplot)
subplot(2,2,2)
loglog(R,V,'bs','MarkerFaceColor','b','MarkerSize',14)
axis([0 3 0 60])
xlabel('Radius (R) [cm]','FontSize',12)
ylabel('Volume (V) [cm^3]')
grid on

C=polyfit(log10(R),log10(V),1);
m=C(1);
b=10^C(2);

xpf=linspace(min(R),max(R),100);
ypf=b*xpf.^m;

hold on
loglog(xpf,ypf,'-b','LineWidth',3)

TE=sprintf('V = %0.1f R^{%0.1f}',b,m);
text(1,5,TE,'BackgroundColor','w','EdgeColor','b','Color','b','FontSize',14)


%Exponential

t=[1 5 15 20 30];
V=[18.1 12.1 4.5 2.75 1];

%figure('Color','w')
subplot(2,2,3)
semilogy(t,V,'hg','MarkerSize',14,'MarkerFaceColor','g')
axis([0 40 0 150])
xlabel('Time (t) [s]','FontSize',12)
ylabel('Voltage (V) [V]','FontSize',12)
grid on
hold on
C=polyfit(t,log(V),1);
m=C(1);
b=exp(C(2));

xpf=linspace(min(t),max(t),100);
ypf=b*exp(m*xpf);
semilogy(xpf,ypf,'--g')
TE=sprintf('V = %0.0f e^{%0.1f t}',b,m);
text(1,5,TE,'BackgroundColor','w','EdgeColor','g','Color','g','FontSize',14)
