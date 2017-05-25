function [x,df]=newton(f,x)
syms x1 x2 a
k=1;
x(k,:)=x;

gf1(x1,x2)=diff(f,x1);
gf2(x1,x2)=diff(f,x2);

h11(x1,x2)=diff(gf1(x1,x2),x1);
h12(x1,x2)=diff(gf1(x1,x2),x2);
h21(x1,x2)=diff(gf2(x1,x2),x1);
h22(x1,x2)=diff(gf2(x1,x2),x2);

H(x1,x2)=[h11(x1,x2) h12(x1,x2);h21(x1,x2) h22(x1,x2)];
df(k,:)=[double(gf1(x(k,1),x(k,2))) double(gf2(x(k,1),x(k,2)))];
tic;
while((abs(double(df(k,1)))>1e-2)&&(abs(double(df(k,2)))>1e-2))
x(k+1,:)=x(k,:)-((VPA(H^-1))*df(k,:)')';
k=k+1;
df(k,:)=[double(gf1(x(k,1),x(k,2))) double(gf2(x(k,1),x(k,2)))];
end
toc;
end