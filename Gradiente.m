function [x,df]=Gradiente(f,x,al_contr,eq)
syms x1 x2 a
k=1;
x(k,:)=x;

gf1(x1,x2)=diff(f,x1);
gf2(x1,x2)=diff(f,x2);

df(k,:)=[double(gf1(x(k,1),x(k,2))) double(gf2(x(k,1),x(k,2)))];
tic;
while((abs(double(df(k,1)))>1e-2)&&(abs(double(df(k,2)))>1e-2))
% while((abs(double(df(k,1)))>1e-2)||(abs(double(df(k,2)))>1e-2))

xa=x(k,:)-a*df(k,:);
g(a)=f(xa(1),xa(2));
if al_contr~=0
    al(k)=al_contr;
else
    switch eq
        case 0
            [A,B,~,~]=bissecao(g,-10,10);
            al(k)=(A(end)+B(end))/2;
        case 1
            [A,B,~,~,~]=sec_aurea(g,-10,10);
            al(k)=(A(end)+B(end))/2;
    end
end
    
     
x(k+1,:)=x(k,:)-al(k)*df(k,:);
k=k+1;
df(k,:)=[double(gf1(x(k,1),x(k,2))) double(gf2(x(k,1),x(k,2)))];
disp([x(end,:);df(end,:)])
end
toc;
end