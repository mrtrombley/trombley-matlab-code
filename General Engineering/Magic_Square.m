% Problem Statement: Create a program to determine the classification of a
% magic square.

% Variables
% check - overall check value for seeing if all conditions are met
% check2 - check to see if an individual condition is met
% square - magic square entered by the user
% matsize - size of the magic square
% testsum - sum of one row to compare all other rows and columns to
% magicconstant - magic constant of the magic square
% semimagic - sets if the square is semimagic or not
% diagonalsum - sum of the diagonal values of the matrix
% val - value of a certain diagonal to add to the overall diagonal sum
% normal - sets if the square is normal or not
% bigvals - largest value in the matrix
% perfect - sets if the square is perfect or not
% group - cell array containing the classification of the magic square

clear
clc

%Set initial check value

check=0;

%Create a while loop to analyze the matrix

while check == 0

    %Allow the user to enter their magic square

    square=input('Please enter your magic square in the form [a b; c d]:\n');

    %Set the second check value for individual cases

    check2=0;

    %Check if the matrix has negative values

    if check2 == 0
        for i=1:length(square)
            for j=1:length(square)
                if square(i,j) < 0
                    warning('One or more of the values in the matrix is negative.')
                    check=0;
                else check2=1;
                    check=1;
                end
            end
        end
    end

    %Check if the matrix is 4 x 4

    if check2 == 1 && check == 1
        matsize=size(square);
        if matsize(1) ~= 4 || matsize(2) ~= 4
            warning('You did not enter a 4 x 4 matrix.')
            check=0;
            check2=0;
        else check2=2;
            check=2;
        end
    end

    %Check if the matrix is actually a magic square

    if check2 == 2 && check == 2
        testsum=sum(square(1,:));
        for i=1:length(square)
            if sum(square(i,:)) ~= testsum || sum(square(:,i)) ~= testsum
                warning('This is not a magic square.')
                check=0;
                check2=0;
            else magicconstant=testsum;
                semimagic='yes';
                check=3;
                check2=3;
            end
        end
    end
end

%Set the initial diagonal sum

diagonalsum=0;

%Add the diagonal values together

for i=1:length(square)
    val=square(i,i);
    diagonalsum=diagonalsum+val;
end

%Determine if the matrix is normal

if diagonalsum == testsum
    normal='yes';
else normal='no';
end

%Determine if the matrix is perfect

bigvals=max(square);
if bigvals(1) == 16
    perfect='yes';
else perfect='no';
end

%Print the ouptut from the analysis of the magic square

fprintf('\nThe magic constant for your magic square is %0.0f. The classification for your magic square:\n\n',magicconstant)
group={'Semi-magic' 'Normal' 'Perfect'; semimagic normal perfect};
fprintf('%s\t%s\t\t%s\n',group{1,1},group{1,2},group{1,3})
fprintf('   %s\t\t %s\t\t  %s\n',group{2,1},group{2,2},group{2,3})
