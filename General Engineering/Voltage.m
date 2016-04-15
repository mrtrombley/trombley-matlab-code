%Problem Statement: Calculate voltage over a period of time using input
%given by the user and place the results in a table.

%Variables
%tau - time constant [s]
%theta - frequency [rad/s]
%t0 - initial time [s]
%tf - final time [s]
%steps - number of steps between initial & final time [-]
%stepsize - actual size of each step [-]
%Q - counter for the loop
%Time - matrix containing time values [s]
%Voltage - voltage for the given times [volts]
%T - table of the times & voltages

clear
clc

%Allow the user to input values

tau=input('Enter the time constant [s]: ');
theta=input('Enter the frequency [rad/s]: ');
t0=input('Enter the initial time [s]: ');
tf=input('Enter the final time [s]: ');
steps=input('Enter the number of steps: ');

%Calculate the step size

stepsize=(tf-t0)/steps;

%Create a loop for calculating voltages

Q=0;

for t=t0:stepsize:tf
    Q=Q+1;
    Time(1,Q)=t;
    Voltage(1,Q)=exp(-t./tau).*cos(theta*t);
end

%Display a formatted statement with user input

fprintf('\nCalculations of the equation e^(-t/%0.3f)cos(%0.3ft) from %0.3f to %0.3f seconds.\n',tau,theta,t0,tf);

%Display the ouptut in a table

Time=Time';
Voltage=Voltage';
T=table(Time,Voltage)
