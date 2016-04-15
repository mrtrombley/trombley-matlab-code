%Problem Statement: Use if and elseif statements to display output from a user's input  

%Variables
%caroptions - cell array containing vehicle types
%transoptions - cell array containing transmission types
%cartype - type of car as specified by the user
%trans - type of transmission as specified by the user

clear
clc

%Define starting variables

caroptions={'Car' 'Truck' 'SUV' 'Motorcycle' 'Other'};
transoptions={'manual' 'automatic'};

%Allow user to input vehicle type

cartype=menu('Select your vehicle: ',caroptions{:});
    if cartype==1
        cartype=caroptions(1);
    elseif cartype==2
        cartype=caroptions(2);
    elseif cartype==3
        cartype=caroptions(3);
    elseif cartype==4
        cartype=caroptions(4);
    elseif cartype==5
       cartype=inputdlg('Enter a vehicle type');
    end

%Allow user to input transmission type

trans=menu('Select your transmission',transoptions{:});

%Display the user's selection

fprintf('You selected a %s with %s transmission.\n',cartype{1},transoptions{trans});
