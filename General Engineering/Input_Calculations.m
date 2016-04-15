%Problem Statement: Calculate amount of oxygen gas in a container based on a user-specified volume

%Variables
%V - volume of the container [gal]
%MW_Oxygen - molecular weight of the oxygen gas [g/mol]
%T - temperature of the object [deg C]
%P - pressure [atm]
%R - gas constant [L*atm/mol*K]
%N - amount of moles of gas [mol]
%M - mass of the oxygen gas

clear
clc

%Input constants

MW_Oxygen=32;
R= 0.0821;

%Allow the user to input the volume

V=input('Enter the volume of the container [gal]: ');
T=input('Enter the temperature of the container [deg C]: ');
P=input('Enter the pressure of the container [atm]: ');

%Convert to SI

T=T+273;
V=V/0.264;

%Calculate number of moles of gas in the container

N=(V*P)/(R*T);

%Calculate the mass of the gas

M=N*MW_Oxygen;
fprintf('The mass of oxygen gas in the container is %0.2f g.\n',M)
