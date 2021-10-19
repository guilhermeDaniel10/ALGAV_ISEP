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
 menor([Hx|Tx],R):-menor(Tx,R1),((Hx<R1), R is Hx; R is R1).

% Contar nome de numeros impares e pares numa lista

contarPI([],0,0).
contarPI([Hx|Tx],Pares,Impares):-contarPI(Tx, Pares1, Impares1),Mod is mod(Hx,2), 
((Mod == 0 -> Pares is Pares1 + 1, Impares is Impares1);(Pares is Pares1,Impares is Impares1 + 1)).

% Verificar se uma lista tem elementos repetidos

temRepetidos([Hx|Tx]):-member(Hx,Tx),!.
temRepetidos([_|Tx]):-temRepetidos(Tx).

% Apaga

apaga(_,[],[]).
apaga(Num,[Num|Tx],Tx):-!.
apaga(Num,[Hx|Tx],[Hx|Ty]):-apaga(Num,Tx,Ty).

colocarMenor([],[]):-!.
colocarMenor(La,[Hb|Tb]):-menor(La,Hb),apaga(Hb,La,Tb).

% Concatenar duas listas

concatenar([],Lb,Lb).
concatenar([Ha|Hb],Lb,[Ha|Tc]):-concatenar(Hb,Lb,Tc).


% ESTUDA ESTE!!!!!!!!!!!!
% Flatten
flatten2([],[]).
flatten2([[H|T]|L],LF):-!,append([H|T],L,L1),flatten2(L1,LF).
flatten2([X|L],[X|LF]):-flatten2(L,LF).

% Eliminar a primeira ocorrencia de um elemento de uma lista

eliminarP(_,[],[]).
eliminarP(Num,[Num|Tx],Tx):-!.
eliminarP(Num,[Hx|Tx],[Hx|Ty]):-eliminarP(Num, Tx, Ty).

% Eliminar todas as ocorrencias de um elemento de uma lista

eliminarTodas(_,[],[]).
eliminarTodas(Num,[Num|Tx],Lc):- eliminarTodas(Num,Tx,Lc).
eliminarTodas(Num,[Hx|Tx],[Hx|Ty]):-eliminarTodas(Num,Tx,Ty).

% Inserir um elemento numa dada posição numa lista 

inserir(_,0,[],[]).
inserir(Ele,0,L,[Ele|L]):-!.
inserir(Ele,Pos,[Hx|Tx],[Hx|Ty]):- Pos1 is Pos - 1, inserir(Ele, Pos1, Tx, Ty).

% Inverter uma lista 

inverter(L,R):-inverter1(L,[],R).
inverter1([],L,L).
inverter1([Hx|Tx],Lb,Lc):-inverter1(Tx,[Hx|Lb],Lc).

% Uniao de listas

uniao(La,Lb)