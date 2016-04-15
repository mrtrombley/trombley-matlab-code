% Problem Statement: Use a structure array to take user-entered values and
% calculate the weight of a rod on different planets

% Variables:
% v_cal - volume of the rod on Callisto [m^3]
% sg - specific gravity of the rod [g/cm^3]
% w - weight of the rod [lbf]
% m - mass of the rod [kg]
% PlanetInfo - structure array containing planet names, gravitational
% acceleration values, and weight of the rod on the planets

clear
clc

% Set input variables

v_cal=0.3;
sg=4.7;

% Calculate the mass of the rod

m=sg*1000*v_cal;

% Allow the user to input the planet names and their corresponding gravitational accelerations

PlanetInfo(1).Planet_Name=input('Enter the name of planet 1: ', 's');
PlanetInfo(1).Gravity=input('Enter planet 1''s acceleration due to gravity [m/s^2]: ');
PlanetInfo(2).Planet_Name=input('Enter the name of planet 2: ', 's');
PlanetInfo(2).Gravity=input('Enter planet 2''s acceleration due to gravity [m/s^2]: ');
PlanetInfo(3).Planet_Name=input('Enter the name of planet 3: ', 's');
PlanetInfo(3).Gravity=input('Enter planet 3''s acceleration due to gravity [m/s^2]: ');

% Calculate the weight of the rods on the specified planets [lbf]

PlanetInfo(1).WeightOfRod=PlanetInfo(1).Gravity*m*0.225;
PlanetInfo(2).WeightOfRod=PlanetInfo(2).Gravity*m*0.225;
PlanetInfo(3).WeightOfRod=PlanetInfo(3).Gravity*m*0.225;

% Display the output values

fprintf('\nFor the planet %s, the weight of the rod is %0.2f pounds-force\n',PlanetInfo(1).Planet_Name,PlanetInfo(1).WeightOfRod);
fprintf('For the planet %s, the weight of the rod is %0.2f pounds-force\n',PlanetInfo(2).Planet_Name,PlanetInfo(2).WeightOfRod);
fprintf('For the planet %s, the weight of the rod is %0.2f pounds-force\n',PlanetInfo(3).Planet_Name,PlanetInfo(3).WeightOfRod);
