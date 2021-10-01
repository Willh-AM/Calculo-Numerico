# Este programa realiza a elimina��o de Gauss-Jordan
# @X � a matrix de coeficiente
# @y � a matrix de igualdade
# OBS: @x � uma matrix n por n

function ry = Gauss_Jordan(X, y)
  [p, q] = size(X)
  [n, m] = size(y)
  # verifica se as dimens�es s�o v�lidas
  if p != n || p != q
    printf('Dimens�es invalidas')
    return;
  endif 
  
  for k=1:p # alterna entre as linhas de pivoteamento
    pivo = X(k, k)
    
    if pivo == 0 #evita divis�es por zero
      if k >= p
        break
      else
        k = k + 1;
      endif
    endif
    
    l = X(k, :)
    for i=1:p # itera as linhas da matrix
      m = X(i, k) / pivo
      if k != i 
        X(i, :) = X(i, :) - m*l 
        y(i) = y(i) - m*y(k)
      endif
    endfor
  endfor
  printf('Identidade: ')
  for n=1:p # transforma a matrix dos coeficiente em uma matrix diagonal unit�ria
    pivo = X(n, n)
    X(n, n) = X(n, n) / pivo
    y(n) = y(n) / pivo
  endfor
  
  # variaveis de sa�da
  ry = y
endfunction;