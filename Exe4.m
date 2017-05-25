clear all;clc;
format long
syms x; %Atribui a 'x' a propriedade de simbolo do sistema para criar a func
syms x1 x2 al
xi=[4 4];
ff(x1,x2)=2*x1^3+(x2-8)^2+exp(-x1);
disp('Processo de minimazação');
k=0;

gf1(x1,x2)=diff(ff,x1);
gf2(x1,x2)=diff(ff,x2);

df=[double(gf1(xi(1),xi(2))) double(gf2(xi(1),xi(2)))];

xa=xi-al*df;

g(al)=ff(xa(1),xa(2));
% f(x)=x^4-15*x^3+12*x^2-90*x;    %Função Problema
%f(x)=((x^2)/2)-sin(x);         %Exemplo aula
f(x)=1088*x^2-320*x;
x=linspace(-100,2,999);  %Cria um vetor de -10 até 20,contendo 400 pontos
a=-50;    %Valor inicial para o ponto A
b=2;    %Valor inicial para o ponto B
plot(x,f(x),'r')    %Plota a função problema
grid on;    %Habilita o grid
hold on;    %Mantem o plot
metodo=0;   % 0=Bisseção; 1=Seção Aurea
if (metodo==1)
    met='Seção Aurea';
else
    met='Bisseção';
end
disp(['Método da ' met ' selecionado! Os pontos [a,b] iniciais são [' ...
    num2str(a) ',' num2str(b) ']']);
disp('------------------------------------------------------------------');
switch metodo  %Seleciona o método
    case 0
        [A,B,LAMB,ERRO]=bissecao(f,a,b);    %Método da Bisseção %f=função, a=ponto inical, b=ponto inicial
        Vars={'a' 'b' 'Lambda' 'f_lamb' 'Erro'};
        Names={num2str(zeros(1,size(LAMB,2)))};
        for k=1:size(LAMB,2)
            Names(k)={sprintf('Iteração nº%d',k)};
        end
        ff=diff(f);
        T = table(A',B',LAMB',double(ff(LAMB')),ERRO','VariableName',Vars,'RowNames',Names);
    case 1
        [A,B,LAMB,U,ERRO]=sec_aurea(f,a,b);   %Método da Seção Aurea %f=função, a=ponto inical, b=ponto inicial
        Vars={'a' 'b' 'Lambda' 'Mi_u' 'f_lamb' 'f_mi' 'Erro'};
        Names={num2str(zeros(1,size(LAMB,2)))};
        for k=1:size(LAMB,2)
            Names(k)={sprintf('Iteração nº%d',k)};
        end
        T = table(A',B',LAMB',U',double(f(LAMB')),double(f(U')),ERRO',...
            'VariableName',Vars,'RowNames',Names);
end
plot(A,f(A),'go',B,f(B),'yo',LAMB,f(LAMB),'x')
disp(T);
format short