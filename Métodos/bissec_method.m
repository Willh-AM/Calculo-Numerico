close all;
clear all;
home;
# M�todo da bissec��o

# define uma fun��o no octave


disp("Programa para calcular a raiz de uma fun��o n�o linear atrav�s do m�todo da bissec��o");
tol = input("Insira a toler�ncia: ");
a = input("Insira o limite inferior do intervalo, a: ");
b = input("Insira o limite inferior do intervalo, b; ");  

contador = 0;
cmax = 300;
xi = 0;
# calcula a primeira m�dia/aproxima��o
xf = (a + b) / 2.;

f = @func1;

while (abs(f(xf)) > tol || abs(1-xi/xf) > tol) && contador >= cmax
  # verifica em qual dos intervalos est� a raiz
  if(f(a)*f(xf) < 0)
    #a = a;  # redudante(apenas para fixar)
    b = xf; 
  else
    a = xf;
    #b = b;
  end
  contador++;  # incrementa contador em 1
  xi = xf; # define a aproxima��o nova como antiga
  xf = (a + b) / 2.;  # recalcula uma nova aproxima��o
  
  #repete at� condi��o de parada
end

fprintf("Raiz encontrada com toler�ncia (tol) %f\n", tol);
fprintf("Raiz encontrada (xf) = %f\n", xf');
fprintf("Numero de itera��es (contador) = %i\n", contador);