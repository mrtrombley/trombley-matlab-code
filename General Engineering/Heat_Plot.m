%Problem Statement: Plot the relationship between energy and change in
%temperature.

%Variables
%Heat - matrix containing heat applied data [J]
%Temp - matrix containing temperature change [K]
%x - matrix containing points to use for the trendline
%A - coefficients for the trend line
%m - slope
%b - y intercept
%y - equation for the trend line
%eq - text string to use for the trend line equation

clear
clc
close all

%Set matrices for data from the table

Heat=[12 17 25 40 50 58];
Temp=[1.50 2.00 3.25 5.00 6.25 7.00];

%Set the figure background color

figure('color','white')

%Plot the graph of heat vs. temperature change

plot(Heat,Temp,'o','MarkerSize',8,'MarkerFaceColor','red')

%Give the axes appropriate labels

xlabel('Heat Applied (Q) [J]','Color','black','FontSize',12)
ylabel('Temp. Change (Delta T) [K]','Color','black','FontSize',12)

%Turn gridlines on

grid on

%Give the graph a title

title('Experimental Temperature Change Data')

%Set the axis spacing

axis([10 60 0 7])

%Solve for the trendline, then plot it and place the equation on the graph

x=linspace(min(Heat),max(Heat),100);
A=polyfit(Heat,Temp,1);
m=A(1);
b=A(2);
y=m*x+b;
hold on
plot(x,y,'--r')
eq=sprintf('T = %0.2f Q + %0.2f',m,b);
text(20,5,eq,'BackgroundColor','white','EdgeColor','r','Color','r')
