%Problem Statement: Determine what level of the atmosphere a user-specified altitude is in  

%Variables
%alt - user-entered altitude value [m]
%level - level of the atmosphere the altitude is in
%t - temperature at the given altitude [deg C]
%p - pressure at the given altitude [kPa]

clear
clc

%Allow the user to enter an altitude

alt=input('Enter an altitude [m]: ');

%Reject altitude if negative, then find atmosphere level, temperature, and pressure

if alt<0
    error('A negative value was entered. Please enter a positive value.')
elseif alt<11000
    level='troposphere';
    t=15.04-0.00649*alt;
    p=101.29*((t+273.1)/288.08)^5.256;
elseif alt>=11000 && alt<25000
    level='lower stratosphere';
    t=-56.46;
    p=22.65*exp(1.73-0.000157*alt);
else
    level='upper stratosphere';
    t=-131.21+0.00299*alt;
    p=2.488*((t+273.1)/216.6)^-11.388;
end

%Print the final output statement containing the results

fprintf('An altitude of %0.0f is in the %s with a temperature of %0.0f degrees C and pressure of %0.0fkPA.\n',alt,level,t,p);
