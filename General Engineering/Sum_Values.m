%Problem Statement: Use while loops to find the last number to add to make
%a sum of numbers greater than a user-specified value.

%Variables
%tn - target number set by the user
%totalsum - sum of all the numbers
%num - next number in the sequence to add to the total

clear
clc

tn=input('Please enter the target number: ');
totalsum=1;
num=1;

while totalsum<=tn
    num=num+2;
    totalsum=totalsum+num;
end

fprintf('The last number added to make the sum greater than %0.0f is %0.0f.\n',tn,num)
