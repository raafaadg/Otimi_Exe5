close all
% clear all
clc;

syms x1 x2 a1
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
        x=[0 0];
        f(x1,x2)=2*x1^3+(x2-8)^2+exp(-x1);
        zz=2.*xx.^3+(yy-8).^2+exp(-xx);
        alfa=[0 .1 .3 .6];
    case 2
        [xx,yy]=meshgrid(-7:.25:7,-20:.5:36);
        x=[0 0];
        u=10;
        p=2;
        f(x1,x2)=2*x1^2+3*x2^2-4*x1-16*x2+u*(log(2*x1-x2+2)+log(-4*x1-x2+3));
        f(x1,x2)=2*x1^2+3*x2^2-4*x1-16*x2+p*1/2*...
            (16*x1^2+x2^2+8*x1*x2-24*x1-6*x2+9);
%         zz=2.*xx.^2+3.*yy.^2-4.*xx-16.*yy+u*(log(2*xx-yy+2)+log(-4*xx-yy+3));
        zz=2.*xx.^2+3.*yy.^2-4.*xx-16.*yy;
        alfa=0;
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
        uni=input('Selecione o Método de Busca Unidimensional -> 0 = Bisseção; 1 = Seção Aurea\n');
        for it=1:size(alfa,2)
            if alfa(it)==0
                disp('Executando método com o alfa ótimo');
            else
                disp(['Executando método com o alfa = ' num2str(alfa(it))]);
            end
            [X,DF,ALFA]=Gradiente(f,x,alfa(it),uni);
            plot(X(:,1),X(:,2),'LineWidth',1,...
            'Marker','o',...
            'MarkerSize',5,...
            'DisplayName',['alfa = ' num2str(alfa(it))])           
            hold on
            clear Names
            for k=1:size(X,1)
                Names(k)={sprintf('Iteração nº%d',k)};
            end
            ALFA=ALFA';
            T = table(X(:,1),X(:,2),DF(:,1),DF(:,2),ALFA,...
            'VariableName',{'X1','X2','DF1','DF2','ALFA'},'RowNames',Names)
        end
    case 1
        disp('Método de Newton Selecionado');
        [X,DF]=newton(f,x);
        plot(X(:,1),X(:,2),'LineWidth',1,...
            'Marker','o',...
            'MarkerSize',5)
        hold on    
        for k=1:size(X,1)
                Names(k)={sprintf('Iteração nº%d',k)};
        end
            T = table(X(:,1),X(:,2),DF(:,1),DF(:,2),...
            'VariableName',{'X1','X2','DF1','DF2'},'RowNames',Names)
end
legend('show')
