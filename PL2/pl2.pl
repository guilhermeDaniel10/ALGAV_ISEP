% Verificar se um membro pertence a uma lista
pertence(X,[X|_]). % verdade se X for a cabeca da lista 
pertence(X,[_|L]):-pertence(X,L). % faz recursao para saber se X pertence alguma vez a lista

% Descobrir o tamanho de uma lista 
tamanho([],0). % assim que a lista deixar de ter algum elemento e o segundo argumento for 0, para
tamanho([_|T],R):-tamanho(T,R1), R is R1 + 1. % vai retirando os elementos da head, e soma 1 a cada iteracao

% Soma de todos os elementos de uma lista
soma([],0).
soma([H|T],R):- soma(T,R1), R is R1 + H.

% Media dos elementos inteiros de uma lista
media([H|T],R):-soma([H|T],Soma),tamanho([H|T],Quantidade),Quantidade > 0,R is Soma / Quantidade.


% Menor de dois numeros
menordois(X,Y,R):-X>Y,R is Y;R is X.

% Menor valor de uma lista
menor([X],X). % Percorre a lista inteira ate chegar ao final
menor([H,H2|T],Min):-menor([H2|T],Min1),menordois(H,Min1,Min). % compara sucessivamente o header em que se encontra com o valor minimo atual

% Quantidade de pares e impares numa lista de inteiros

quantidadeParImp([],0,0).
quantidadeParImp([H|T],P,I):- quantidadeParImp(T, P1, I1), NumAtual is mod(H,2),
    ((NumAtual == 0 -> P is P1 + 1, I is I1);(P is P1, I is I1 + 1)).

% Verificar elementos repetidos numa lista

% Descobrir o numero de repetidos com um determinado numero
umLoopRepetidos(_,[],0). 
umLoopRepetidos(Num,[H|T],R):- umLoopRepetidos(Num,T,R1), ((Num == H, R is R1 + 1);R is R1).

repetidos([],0).
repetidos([H|T],R):- repetidos(T,R1), ((umLoopRepetidos(H,[H|T],R1), R is R1)).

