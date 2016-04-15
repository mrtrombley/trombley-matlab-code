%Problem Statement: Create a plot displaying the relationship between time
%after installation of a  stoplight and violation times.

%Variables
%Time - matrix containing time values [s]
%Int1,Int2,Int3 - matrices containing violation times for the three intersections [s]
%L - cell array containing labels from the data table
%x - matrix containing points to use for the trendlines
%A,B,C - coefficients for the trend lines for the corresponding equations
%m1,m2,m3 - slopes for the corresponding lines
%b1,b2,b3 - y-intercepts for the corresponding lines
%y1,y2,y3 - equations for the corresponding lines
%eq1,eq2,eq3 - text strings to use for the trend line equations for the
%corresponding equations

clear
clc
close all

%Set matrices for data from the table

Time=[2;5;8;11];
Int1=[0.05;0.1;0.3;0.4];
Int2=[0.1;0.5;1;1.3];
Int3=[0.5;1.5;2.5;3.1];

%Set the figure background color

figure('color','white')

%Plot the graph of time vs. the violation times and set the marker
%properties

plot(Time,Int1,'o','MarkerSize',8,'MarkerFaceColor','red')
hold on
plot(Time,Int2,'s','MarkerSize',8,'MarkerFaceColor','blue')
plot(Time,Int3,'d','MarkerSize',8,'MarkerFaceColor','black')
xlabel('Time After Installation (t) [months]','Color','black','FontSize',12)
ylabel('Violation Time (V) [s]','Color','black','FontSize',12)

%Turn gridlines on

grid on

%Give the graph a title

title('Traffic Light Violation Data')

%Display a legend for the data points

L={'Intersection 1 (1 Second Delay)';'Intersection 2 (2 Second Delay)';'Intersection 3 (4 Second Delay)'};
legend(L,'Location','best');

%Set the axis spacing

axis([0 11 0 3.5])

%Solve for the trendline equations and place the equations on the graph

x=linspace(min(Time),max(Time),100);

A=polyfit(Time,Int1,1);
m1=A(1);
b1=A(2);
y1=m1*x+b1;
eq1=sprintf('V = %0.2f T + %0.2f',m1,b1);
text(8,0.6,eq1,'BackgroundColor','white','EdgeColor','r','Color','r')

B=polyfit(Time,Int2,1);
m2=B(1);
b2=B(2);
y2=m2*x+b2;
eq2=sprintf('V = %0.2f T + %0.2f',m2,b2);
text(8,1.5,eq2,'BackgroundColor','white','EdgeColor','b','Color','b')

C=polyfit(Time,Int3,1);
m3=C(1);
b3=C(2);
y3=m3*x+b3;
eq3=sprintf('V = %0.2f T + %0.2f',m3,b3);
text(1.75,1.6,eq3,'BackgroundColor','white','EdgeColor','k','Color','k')


%Plot the trendlines

plot(x,y1,'--r')
plot(x,y2,'--b')
plot(x,y3,'--k')
