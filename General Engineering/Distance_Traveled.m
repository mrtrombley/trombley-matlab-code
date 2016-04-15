%Problem Statement: Determine how far the Microjoule will travel in
%kilometers given a user-specified amount of ethanol

%Variables:
%e = amount of ethanol [g]
%m = fuel performance [mi/gal]
%rho_e = density of ethanol [kg/m^3]
%d = total distance traveled [km]
%SG = specific gravity of ethanol [-]

clear
clc

%Set input variables

m=10705;
rho_e=789;
e=input('Enter an amount of fuel [g]: ');

%Convert density to specific gravity

SG=(rho_e)/1000;

%Convert m from [mi/gal] to [km/g]

m=((m*.264)/1000)*(1/SG)/.621;

%Calculate the distance traveled in km

d=e*m;

%Display the output

fprintf('The MicroJoule will travel %0.2f km\n',d)
