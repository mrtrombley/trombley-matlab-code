%This script allows for the operation of a password-protected motor connected to an Arduino. Interfacing is done in MATLAB.
clc
clear all
close all
pass='Clemson';
flag=0;
choice=0;
while choice == 0
choice=menu('What would you like to do?','Operate the motor','Quit');
    if choice == 2
        return
    end
end
if exist('a','var') && isa(a, 'arduino') && isvalid(a),
   %nothing
else
    a=arduino('COM3');
end
a.pinMode(5, 'INPUT'); %Button pin
a.pinMode(12, 'OUTPUT'); %Green LED pin
a.pinMode(13, 'OUTPUT'); %Red LED pin
a.pinMode(2, 'OUTPUT'); %Motor pin
msgbox('Press the button on the breadboard to enter the password. Press Ctrl + C to quit.')
green=0;
red=0;
while isvalid(a)
    volt = a.digitalRead(5);
    if volt == 1 && flag == 0
        entry=inputdlg('Enter the password.')
        if strcmp(pass, entry{1}) == 1
            msgbox('Password correct, press button again to operate motor.')
            green=1;
            flag=1;
            a.digitalWrite(12, green);
            pause(5)
            green=0;
            a.digitalWrite(12, green);
        else
            red=1;
            a.digitalWrite(13, red);
            msgbox('Incorrect password, quitting program now.')
            pause(5)
            red=0;
            a.digitalWrite(13, red)
            return
        end
    elseif volt == 1 && flag == 1
        a.digitalWrite(2, volt);
        pause(5)
        volt = 0;
        a.digitalWrite(2, volt);
    else
        volt = 0;
    end
end
