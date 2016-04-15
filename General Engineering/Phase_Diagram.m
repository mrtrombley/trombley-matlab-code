%Problem Statement: Take a user-set percent composition for a solution and
%its temperature, then determine its phase.

%Variables
%point11-point62 - reference points to calculate the phase lines
%point71-point72 - reference points for the eutectic point & line
%line1-line6 - coefficients for the phase lines
%m1-m6 - slope of the phase lines
%b1-b2 - y-intercepts of the phase lines
%xpf1-xpf6 - points to use for the phase lines
%ypf1-ypf6 - lines to divide the phases
%b - mass percent of B
%t - temperature of the solution [deg C]
%a - mass percent of A
%phase - phase of the solution based on percent B and temperature

clear
clc
close all


%Use polyfit to solve for the phase lines

point11=[0,15];
point12=[0,300];
line1=polyfit(point11,point12,1);
m1=line1(1);
b1=line1(2);
xpf1=linspace(min(point11),max(point11),100);
ypf1=m1*xpf1+b1;
point21=[0,15];
point22=[700,300];
line2=polyfit(point21,point22,1);
m2=line2(1);
b2=line2(2);
xpf2=linspace(min(point21),max(point21),100);
ypf2=m2*xpf2+b2;
point31=[0,50];
point32=[700,300];
line3=polyfit(point31,point32,1);
m3=line3(1);
b3=line3(2);
xpf3=linspace(min(point31),max(point31),100);
ypf3=m3*xpf3+b3;
point41=[50,100];
point42=[300,800];
line4=polyfit(point41,point42,1);
m4=line4(1);
b4=line4(2);
xpf4=linspace(min(point41),max(point41),100);
ypf4=m4*xpf4+b4;
point51=[100,85];
point52=[800,300];
line5=polyfit(point51,point52,1);
m5=line5(1);
b5=line5(2);
xpf5=linspace(min(point51),max(point51),100);
ypf5=m5*xpf5+b5;
point61=[85,100];
point62=[300,0];
line6=polyfit(point61,point62,1);
m6=line6(1);
b6=line6(2);
xpf6=linspace(min(point61),max(point61),100);
ypf6=m6*xpf6+b6;
point71=[15,85];
point72=[300,300];

%Allow the user to set the percent of B

b=input('Enter the mass percent of B: ');

%Return an error if the percent of B is not a valid number

if b<0 || b>100
    error('Please enter a value between 0 and 100.')
end

%Allow the user to set the temperature

t=input('Enter the temperature [deg C]: ');

%Solve for percent composition of A

a=100-b;

%Determine phase based on temperature and percent composition of B using
%the phase lines

if t<300
       if b<15 && t>m1*b+b1
           phase='alpha';
       elseif b<15 && t<m1*b+b1
           phase='alpha + beta';
       elseif b>=15 && b<=85
           phase='alpha + beta';
       elseif b>85 && t>m6*b+b6
           phase='beta';
       else phase='alpha + beta';
       end
elseif b<15
    if t<m2*b+b2
        phase='alpha';
    elseif t<m3*b+b3
        phase='alpha + Liquid';
    else phase='Liquid';
    end
elseif b>=15 && b<=50
    if t<m3*b+b3
        phase='alpha + Liquid';
    else phase='Liquid';
    end
elseif b>50 && b<=85
    if t<m4*b+b4
        phase='beta + Liquid';
    else phase='Liquid';
    end
else
    if t<m5*b+b5
        phase='beta';
    elseif t<m4*b+b4
        phase='beta + Liquid';
    else phase='Liquid';
    end
end

%Print out a message if the point falls on the eutectuc line or point

if b>=15 && b<=85 && t==300
    fprintf('The provided conditions fall on the eutectic line.\n')
end
if b==50 && t==300
    fprintf('The provided conditions fall on the eutectic point.\n')
end

%Output a formatted statement to display the phase

fprintf('For the composition of %0.2f%% A, %0.2f%% B and a temperature of %0.0f degrees Celsius, the phase is %s.\n',a,b,t,phase)

%Create a plot of the phase lines and the user's set point

figure('color','white')

%Set axes

axis([0 100 0 1000])

%Plot the phase lines, eutectic line, eutectic point, and the user's point

plot(xpf1,ypf1,'-b')
hold on
plot(xpf2,ypf2,'-b')
plot(xpf3,ypf3,'-b')
plot(xpf4,ypf4,'-b')
plot(xpf5,ypf5,'-b')
plot(xpf6,ypf6,'-b')
plot(point71,point72,'-k')
plot(b,t,'ro','MarkerFaceColor','r')

%Assign a title and axes labels

title('Phase Diagram of Elements A and B')
xlabel('Percent Composition of B')
ylabel('Temperature (T) [deg C]')

%Set scaling for the axes

set(gca,'XTick',0:10:100,'YTick',0:100:1000)

%Place the phase names on the graph

text(40,200,'alpha+beta')
text(45,600,'Liquid')
text(90,300,'beta')
text(3,300,'alpha')
text(15,375,'alpha + Liquid')
text(62,375,'beta + Liquid')
