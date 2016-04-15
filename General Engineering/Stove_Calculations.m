%Problem Statement: Design a program to calculate the efficiency of
%consumer's stoves based on user-generated values

%Variables:
%room_temp = initial room temperature [deg F]
%b = time it takes the water to boil [min]
%model = stove model [-]
%power = rated power of the stove [W]
%delta_t = change in temperature [deg C]
%calc_power = calculated power of the stove [W]
%eff = efficiency of the stove [-]
%m = mass of 1 gall on water [kg]
%sh = specific heat of water [J/g deg C]
%w = power used by the burner [J]

clear
clc

disp('Household Appliance Efficiency Calculator: Stove')
disp(' ')
room_temp = input('Type the initial room temperature of the water [deg F]: ');
b = input('Type the time it takes the water to boil [min]: ');
model = input('Type the brand name and model of your stove: ', 's');
power = input('Type the power of the stove-top burner [W]: ');
disp(' ')

%Convert initial room temperature to [deg C] & calculate change in
%temperature

room_temp=(room_temp-32)/1.8;
delta_t=100-room_temp;

%Convert boiling time to [s]

b=b*60;

%Convert specific heat of water to [J/kg deg C]

sh=4.179*1000;

%Calculate the mass of 1 gallon of water in [kg]

m=(1*1000)/(0.264*1000);

%Calculate power of stove & energy required based on user's input

w=m*sh*delta_t;
calc_power=w/b;

%Display energy required and power used by the burner

fprintf('Energy Required: %14.0f J\n',w)
fprintf('Power used by burner: %6.0f W\n',calc_power)
disp(' ')

%Calculate efficiency of the stove

eff=(calc_power/power)*100;

fprintf('Burner efficiency for a %s stove: %0.1f%%\n',model,eff)
