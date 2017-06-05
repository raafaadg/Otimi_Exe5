function [a,b,lamb,u,erro] = sec_aurea(f,a,b)
au=0.618;   %Denife o valor Aureo
it=1;       %Variável para controlar as iterações
lamb(it)=a(it)+(1-au)*(b(it)-a(it));    %Calcula Alfa1
u(it)=a(it)+au*(b(1)-a(1));             %Calcula u1
erro(it)=abs(double(f(b(it)))-double(f(a(it)))); %Calcula erro inicial
% erro(it)=abs(b(it)-a(it));
% erro(it)=abs(double(f(lamb(it)))-double(f(u(it))));
while(erro(it)>1e-4)    %Execute enquanto e erro for menor que 10^-3
   if(double(f(lamb(it)))<double(f(u(it)))) %Se Alfa < u
       a(it+1)=a(it);       % a seguinte recebe a anterior
       b(it+1)=u(it);       % b seguinte recebe u anterior
       u(it+1)=lamb(it);    % u seguinte recebe Alfa anterior
       lamb(it+1)=a(it+1)+(1-au)*(b(it+1)-a(it+1)); % Calcula o novo Alfa
   else
       a(it+1)=lamb(it);    % a seguinte recebe Alfa anterior
       b(it+1)=b(it);       % b seguinte recebe b anterior
       lamb(it+1)=u(it);    % Alfa seguinte recebe u anterior
       u(it+1)=a(it+1)+au*(b(it+1)-a(it+1));    % Calcula o novo u
   end
   
   
%    disp(['Iteração nº ' num2str(it) ' -> ERRO : ' num2str(erro(it)) ...
%        ' [ a = ' num2str(a(it)) ' , b = ' num2str(b(it)) ...
%        ', Lambda = ' num2str(lamb(it)) ', Mi{u} = ' num2str(u(it)) ...
%        ', f(lamb) = ' num2str(double(f(lamb(it)))) ', f(mi) = ' ...
%        num2str(double(f(u(it)))) ' ]']);
   it=it+1;
   erro(it)=abs(double(f(b(it)))-double(f(a(it))));
%    erro(it)=abs(b(it)-a(it));
%    erro(it)=abs(double(f(lamb(it)))-double(f(u(it))));

end
% disp('------------------------------------------------------------------');
% disp('FIM!');
end