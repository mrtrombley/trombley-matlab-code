clear
clc
a=[4.975 4.962 4.95 4.938 4.925 4.912 4.897 4.886 4.873 4.859 4.846 4.835 4.822 4.809 4.797 4.783 4.771 4.758 4.745 4.732 4.719];
b=[4.963 4.95 4.938 4.926 4.913 4.899 4.886 4.873 4.861 4.847 4.835 4.823 4.81 4.798 4.785 4.772 4.759 4.746 4.734 4.72 4.708];
l=[0 0.005 0.01 0.015 0.02 0.025 0.03 0.035 0.04 0.045 0.05 0.055 0.06 0.065 0.07 0.075 0.08 0.085 0.09 0.095 0.1];
comb=[a b];
a2=[l l];
comb=sort(comb,'descend');
a2=sort(a2);
line=polyfit(a2,comb,1);
for i=1:length(l)
    c(i)=line(1)*l(i)+line(2);
end
adif=a-c;
bdif=b-c;
err=max(max(adif),max(abs(bdif)));
fse=(err/(max(comb)-min(comb)))*100;
s=abs(line(1));
umicro=.5*(.001);
umulti=0.5*(.001/s);
uc=err/s;
utot=sqrt(power(umicro,2)+power(umulti,2)+power(uc,2));
xbar=mean(a2);
ybar=mean(comb);
num=0;
denom1=0;
denom2=0;
for i=1:length(comb)
    num=num+((a2(i) - xbar)*(comb(i) - ybar));
    denom1=denom1+power(a2(i)-xbar,2);
    denom2=denom2+power(comb(i)-ybar,2);
end
r=num/sqrt(denom1*denom2);
range=(5-0)/abs(line(1));
ysum=0;
for i=1:length(comb)
    bfitp=line(1)*a2(i)+line(2);
    ysum=ysum+power((comb(i)-bfitp),2);
end
serrf=sqrt((1/(length(a2)-1))*ysum);
fprintf('The equation of the line of best fit is y = %0.4fx + %0.4f.\nThe sensitivity is %0.4f.\nThe max error is %0.4f.\nThe percent full scale error is %0.2f.\nThe total uncertainty is %0.4f.\nThe correlation coefficient is %0.4f.\nThe range is %0.4f.\nThe standard error of fit is %0.4f.\n',line(1),line(2),line(1),err,fse,utot,r,range,serrf)