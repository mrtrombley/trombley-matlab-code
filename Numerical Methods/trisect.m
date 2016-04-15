%This function allows the use of the trisection method (modified version of bisection).
function [y,data] = trisect(a,b,func,tol)
fa = feval(func,a);
fb = feval(func,b);
if fa*fb >= 0
    error('The function fails to satisfy f(a)*f(b)<0 for inputs a and b')
end
data = [ 0 a b fa fb b-a];
it_count=0;
while (b-a) > tol
    it_count = it_count+1;
    tri1 = a + ((b-a)/3);
    tri2 = a + ((2*(b-a))/3);
    fnew1 = feval(func,tri1);
    fnew2 = feval(func,tri2);
    if fa*fnew1 <= 0
        b = tri1;
        fb = fnew1;
    elseif fnew1*fnew2 <= 0
        a = tri1;
        b = tri2;
        fa = fnew1;
        fb = fnew2;
    elseif fnew2*fb <= 0
        a = tri2;
        fa = fnew2;
    end
    datanew = [ it_count a b fa fb b-a];
    data = [data;datanew];
end
y = (a+b)/2;
