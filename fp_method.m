# M�todo da falsa posi��o

disp("Programa para calcular a raiz de uma fun��o n�o linear atrav�s do m�todo da falsa posi��o");
tol = input("Insira a toler�ncia: ");
a = input("Insira o limite inferior do intervalo, a: ");
b = input("Insira o limite inferior do intervalo, b; ");  

contador = 0;
xi = 0;
xf = a - f(a)*(b-a)/(f(b)-f(a));
cmax = 300;

f = @func1;

while abs(f(xf)) > tol || abs(1-xi/xf) > tol || contador >= cmax
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
  xf = a - f(a)*(b-a)/(f(b)-f(a));  # recalcula uma nova aproxima��o
  
  #repete at� condi��o de parada
end

fprintf("Raiz encontrada com toler�ncia (tol) %f\n", tol);
fprintf("Raiz encontrada (xf) = %f\n", xf');
fprintf("Numero de itera��es (contador) = %i\n", contador);