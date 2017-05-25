clear all;close all;clc;

syms x1 x2 a
format long
figure(1);
[xx,yy]=meshgrid(0:.2:5);

% x=[0 0];
% zz=xx.^2+4.*yy.^2-8.*xx-16.*yy;
% f(x1,x2)=x1^2+4*x2^2-8*x1-16*x2;

x=[4 4];
zz=2.*xx.^3+(yy-8).^2+exp(-xx);
f(x1,x2)=2*x1^3+(x2-8)^2+exp(-x1);

surfc(xx,yy,zz);

figure(2)
contour(xx,yy,zz);
hold on
grid on
disp('Processo de minimazação');
metodo=0;

switch metodo
    case 0
        [X,DF]=Gradiente(f,x,0)
    case 1
        [X,DF]=newton(f,x)
end

plot(X(:,1),X(:,2),'go')
plot(X(:,1),X(:,2),'k','LineWidth',1)