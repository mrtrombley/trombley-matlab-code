%Problem Statement: Calculate the revenue from baseball bat sales 
%for a company

%Variables:
%maple = selling price of a maple bat [dollars]
%bamboo = selling price of a bamboo bat [dollars]
%ppw = number of bats a manufacturer can produce per week [-]
%weeks = number of weeks manufacturer plans to run production [weeks]
%mr = maple bat revenue [dollars]
%br = bamboo bat revenue [dollars]
%tot = total number of bats produced [-]

clear
clc

%Take company input on prices and sales numbers

maple = input('Type the selling price of a maple bat (in dollars): ');
bamboo = input('Type the selling price of a bamboo bat (in dollars): ');
ppw = input('Type total number of bats manufacturer can produce per week: ');
weeks = input('Type number of weeks manufacturer plans to run production: ');

%Calculate revenue for maple bat

mr=maple*ppw*weeks;

%Calculate revenue for bamboo bat

br=bamboo*ppw*weeks;

%Display revenue for bats together

disp(' ')
fprintf('Producing %0.0f bats a week for %0.0f weeks will generate: \n',ppw,weeks)
fprintf('\t Maple bat revenue: $%0.2f\n',mr)
fprintf('\t Bamboo bat revenue: $%0.2f\n',br)

%Calculate total number of bats produced

tot=ppw*weeks;

disp(' ')
fprintf('Total number of bats produced: %0.3e\n',tot)
