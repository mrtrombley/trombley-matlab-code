%Problem Statement: Determine the volume of fluid needed to cool the rods

%Variables
%delta_t - change in temperature of the glycerol [deg C]
%V - volume of glycerol [gal]
%TE - loss of thermal energy [J]
%SH_gly - specific heat of glycerol [J\g deg C]
%SG_gly - specific gravity of glycerol [-]
%m - mass of glycerol required to cool the rod [g]
%rho_water - specific gravity of water [-]
%D_gly - density of water [g/cm^3]

function[V]=FluidVolume(TE)

%Set input variables

SH_gly=2.4;
SG_gly=1.261;
rho_water=1;
D_gly=rho_water*SG_gly;

%Calcuate the change in temperature

delta_t=50-25;

%Calculate the mass of glycerol for a given temperature

m=-1*TE/(SH_gly*delta_t);

%Find volume in gallons

V=(1/D_gly)*m;
V=V*(1/1000)*0.264;

end
