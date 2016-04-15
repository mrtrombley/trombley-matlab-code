%% Heat Transfer

clear
clc
close all

dx=1;
Q=1000;
k=5;

% Q = k dx dT
% dt = T1 - T2
% T1 = T2 + 

x=[1:dx:10];
y=[1:dx:10];

Told=ones(length(x),length(y));
Told(1,:)=100;
Told(length(y),:)=20;
Told(:,1)=20;
Told(:,length(x))=20;

Tnew=Told;
err=10;

while err > 1
    Tnew(1,:)=Told(2,:)+(Q/(k*dx));
    Tnew(length(y),:)=20;
    Tnew(:,1)=20;
    Tnew(:,length(x))=20;
    [r c]=size(Told);
    for i=2:1:r-1
        for j=2:1:c-1
            Tnew(i,j)=(Told(i-1,j)+Told(i+1,j)+Told(i,j-1)+Told(i,j+1))/4;
        end
    end
    A=abs(Told-Tnew);
    err=sum(sum(A));
   Told=Tnew;
end

contourf(x,y,Tnew)