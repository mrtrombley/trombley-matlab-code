%Problem Statement: Create a function to continually square a number until
%it reaches a certain value.

%Variables
%S - initial number [-]
%Q - number of times S was squared [-]

%Create the function with the input and output variables

function[Q]=Balloon(S)

%Set the initial counter value

Q=0;

%Stop the program if the values will cause an error

if S==-1 || S==0 || S==1
    error('Program Will Run Forever; Please Select A New Number')
end

%Create a loop to square the value and increase the counter

while S<(10^15) && S>(10^-15)
    Q=Q+1;
    S=S^2;
end
