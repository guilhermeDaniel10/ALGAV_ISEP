% Soma de valores

soma([],0).
soma([Hx|Tx],R):-soma(Tx, R1), R is Hx + R1.

% Numero de elementos de uma lista

tamanho([],0).
tamanho([_|Tx],R):-tamanho(Tx,R1), R is R1 + 1.

% Media de valores

media(L,R):- soma(L,Soma), tamanho(L,Tamanho), R is Soma / Tamanho. 

% Menor valor de uma lista de inteiros

menor([X],X):-!. % Significa que quando a lista tiver apenas um elemento, a variavel vazia vai passar a ter o ultimo elemento da lista
menor([Hx|Tx],R):-menor(Tx,R1),((Hx<R1), R is Hx); R is R1).

