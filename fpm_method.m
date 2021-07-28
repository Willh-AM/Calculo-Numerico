clear all;
# M�todo da falsa posi��o modificado

disp("Programa para calcular a raiz de uma fun��o n�o linear atrav�s do m�todo da falsa posi��o");
tol = input("Insira a toler�ncia: ");
a = input("Insira o limite inferior do intervalo, a: ");
b = input("Insira o limite inferior do intervalo, b; ");  
f = @func1;
contador = 0;
xi = 0;
xf = a - f(a)*(b-a)/(f(b)-f(a));
cmax = 300;



while abs(f(xf)) > tol || abs(1-xi/xf) > tol || contador >= cmax
  # verifica em qual dos intervalos est� a raiz
  if(f(a)*f(xf) < 0)
    b = xf;
    F = f(a);
    G = f(b); 
    if (f(xi)*f(xf) > 0)
      F = F/2; 
    end
  
  else
    a = xf;
    F = f(a);
    G = f(b);
    if (f(xi)*f(xf) > 0)
      G = G/2;
    end
  end
  contador++;  # incrementa contador em 1
  
  xi = xf;
  xf = a - F*(b-a)/(G - F);
  
  #repete at� condi��o de parada
end

fprintf("Raiz encontrada com toler�ncia (tol) %f\n", tol);
fprintf("Raiz encontrada (xf) = %f\n", xf');
fprintf("Numero de itera��es (contador) = %i\n", contador);