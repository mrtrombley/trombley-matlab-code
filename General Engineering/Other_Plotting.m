%Problem Statement: Create a plot of pressure versus velocity for a pitot
%tube.

%Variables
%p - matrix containing pressure [Pa]
%v - matrix containing velocities [v]
%C1, C2, C3 - power coefficients for the corresponding trendlines
%m1, m2, m3 - coefficient m for the power equation
%b1, b2, b3 - coefficient b for the power equation
%xpf - data points to use for the trendlines
%ypf1, ypf2, ypf3 - power trendlines for the three fluids
%TE1, TE2, TE3 - text of the trendline equations for the three fluids
%L - cell array containing fluid names
%L1 - legend of fluid names for the graph

clear
clc
close all

%Add the experimental data into matrices

p=[50000 101325 202650 250000 304000 350000 405000 505000];
v=[11.25 16 23 25 28 30 32 35.75; 9 12.5 18 20 22 24 25 28; 7.5 11 15.5 17 19 20 22 24.5];

%Create the graph and set axes

figure('color','white')
axis([0 525000 0 40])

%Plot the three data sets

plot(p,v(1,:),'bo','MarkerFaceColor','b','MarkerSize',10)
hold on
plot(p,v(2,:),'rs','MarkerFaceColor','r','MarkerSize',10)
hold on
plot(p,v(3,:),'gh','MarkerFaceColor','g','MarkerSize',10)

%Create a title, label the axes and turn gridlines on

title('Velocity Calculated By A Pitot Tube')
xlabel('Pressure (P) [Pa]','FontSize',12)
ylabel('Velocity (v) [m/s]')
grid on

%Find the power relationships for the data and create the trendlines

C1=polyfit(log10(p),log10(v(1,:)),1);
m1=C1(1);
b1=10^C1(2);
C2=polyfit(log10(p),log10(v(2,:)),1);
m2=C2(1);
b2=10^C2(2);
C3=polyfit(log10(p),log10(v(3,:)),1);
m3=C3(1);
b3=10^C3(2);
xpf=linspace(min(p),max(p),100);
ypf1=b1*xpf.^m1;
ypf2=b2*xpf.^m2;
ypf3=b3*xpf.^m3;

%Plot the trendlines & add their labels to the graph

plot(xpf,ypf1,'-b','LineWidth',1)
plot(xpf,ypf2,'-r','LineWidth',1)
plot(xpf,ypf3,'-g','LineWidth',1)
TE1=sprintf('v = %0.2f P^{%0.2f}',b1,m1);
TE2=sprintf('v = %0.2f P^{%0.2f}',b2,m2);
TE3=sprintf('v = %0.2f P^{%0.2f}',b3,m3);
text(100000,30,TE1,'BackgroundColor','w','EdgeColor','b','Color','b','FontSize',10)
text(500000,31,TE2,'BackgroundColor','w','EdgeColor','r','Color','r','FontSize',10)
text(450000,20,TE3,'BackgroundColor','w','EdgeColor','g','Color','g','FontSize',10)

%Add a legend to differentiate between points

L={'Fluid A';'Fluid B';'Fluid C'};
L1=legend(L,'Location','southeast');
set(L1,'color','w','TextColor','b','FontSize',10)
