function [a,b,lamb,erro]=bissecao(f,a,b)
it=1;           %Vari�vel para controlar as itera��es
df=diff(f);  %Derivada da fun��o
erro(it)=abs(double(f(b))-double(f(a)));    %Calcula erro inicial
% erro(it)=abs(b(it)-a(it));
lamb(it)=(a(it)+b(it))/2;
while(erro(it)>1e-3)    %Execute enquanto e erro for menor que 10^-3
   
   if(double(df(lamb(it)))<0)       %Caso alfa sej� negativo
       a(it+1)=lamb(it);            % a seguinte recebe alfa atual
       b(it+1)=b(it);               % b seguinte recebe b atual
   elseif(double(df(lamb(it)))>0)   %Caso alfa sej� positivo
       a(it+1)=a(it);               % a seguinte recebe a atual
       b(it+1)=lamb(it);            % b seguinte recebe alfa atual
   elseif(double(df(lamb(it)))==0)  %Caso alfa sej� igual a zero
       disp('LAMBDA = 0');            %Exibe que o Alfa � zero
   end

%    disp(['Itera��o n� ' num2str(it) ' -> ERRO : ' num2str(erro(it)) ...
%        ' [ a = ' num2str(a(it)) ' , b = ' num2str(b(it)) ...
%        ', Lambda = ' num2str(lamb(it)) ' ]']);
   it=it+1; %Incrementa a variav�l de controle da itera��o
   erro(it)=abs(double(f(b(it)))-double(f(a(it))));%Calcula erro atual
%    erro(it)=abs(b(it)-a(it));
   lamb(it)=(a(it)+b(it))/2; %Calcula alfa para os pontos a e b ionformados
end
% disp('------------------------------------------------------------------');
% disp('FIM!');
end