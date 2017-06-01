% clear all;
close all;clc;

syms x1 x2 a
format short

scen=input('Informe 0(zero) para o Problema do Slide ou 1(um) para o Exercício 5\n');
switch scen
    case 0
        [xx,yy]=meshgrid(0:(5/3)/10:5,0:(3/5)/10:3);
        x=[0 0];
        zz=xx.^2+4.*yy.^2-8.*xx-16.*yy;
        f(x1,x2)=x1^2+4*x2^2-8*x1-16*x2;
        alfa=[0 .1 .12 .15];
    case 1
        [xx,yy]=meshgrid(-7:.25:7,-20:.5:36);
        x=[-6 4];
        f(x1,x2)=2*x1^3+(x2-8)^2+exp(-x1);
        zz=2.*xx.^3+(yy-8).^2+exp(-xx);
        alfa=[0 .01 .03 .05];
end
figure(1);
meshc(xx,yy,zz)

figure(2)
contour(xx,yy,zz,'DisplayName','Curvas');
hold on
grid on
disp('Processo de minimazação');
metodo=input('Selecione o Método -> 0 = Gradiente; 1 = Newton\n');
% alfa=[0];
switch metodo
    case 0
        disp('Método do Gradiente Selecionado');
%         uni=input('Selecione o Método de Busca Unidimensional -> 0 = Bisseção; 1 = Seção Aurea\n');
        for it=1:size(alfa,2)
            [X,DF]=Gradiente(f,x,alfa(it),0)
            plot(X(:,1),X(:,2),'LineWidth',1,...
            'Marker','o',...
            'MarkerSize',5,...
            'DisplayName',['alfa = ' num2str(alfa(it))])           
            hold on
            
        end
    case 1
        disp('Método de Newton Selecionado');
        [X,DF]=newton(f,x)
        plot(X(:,1),X(:,2),'LineWidth',1,...
            'Marker','o',...
            'MarkerSize',5)
        hold on    
end
legend('show')
