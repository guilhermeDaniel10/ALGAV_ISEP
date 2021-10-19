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


menorResolucao([X],X):-!.
menorResolucao([X|L],M):-menor(L,M1), ((X<M1,!,M is X); M is M1).

% Quantidade de pares e impares numa lista de inteiros

quantidadeParImp([],0,0).
quantidadeParImp([H|T],P,I):- quantidadeParImp(T, P1, I1), NumAtual is mod(H,2),
    ((NumAtual == 0 -> P is P1 + 1, I is I1);(P is P1, I is I1 + 1)).

% contaPIResolucao([],0,0). Depois de chegar aqui, significa que a lista é vazia e não há mais tentativas
% contaPIResolucao([X|L],P,I):-contaPIResolucao(L,P1,I1),R is X mod 2,((R == 0, !, P is P1+1, I is I1);(I is I1 + 1, P is P1)).

% Verificar elementos repetidos numa lista

% Descobrir o numero de repetidos com um determinado numero
umLoopRepetidos(_,[],0). 
umLoopRepetidos(Num,[H|T],R):- umLoopRepetidos(Num,T,R1), ((Num == H, R is 1, write("Tem repetido"));R is R1).


temRepetidos([]):-false.
temRepetidos([H|T]):-umLoopRepetidos(H,T,R), ((R == 1 -> true,!);temRepetidos(T)).

temRepetidosResol([X|L]):-member(X,L),!.
temRepetidosResol([_|L]):-repetidos(L).

% Inverter uma lista

inverte(L,LI):-inverte1(L,[ ],LI).

inverte1([ ],L,L).
inverte1([X|L],L2,L3):-inverte1(L,[X|L2],L3).

% Menor elemento de uma lista à frente

sendMenor(L,LP):-menorResolucao(L,Men),write('Menor= '),write(Men),auxMenor(L,[],Men,LP).

menorFrenteLista([],[]):-!.
menorFrenteLista(L,[M|L1]):-menor(L,M),apaga(M,L,L1).

apaga(_,[],[]).
apaga(X,[X|L],L):-!.
apaga(X,[Y|L],[Y|L1]):-apaga(X,L,L1).

% Concatenar listas- Resolucao Gui

concatenar([],L,L).
concatenar([Ha|Ta],B,[Ha|D]):-concatenar(Ta,B,D).
 % No caso de concatenar, a header da lista 1 será limpa constantemente até que não tenha qualquer valor (D continua vazio)
 % quando fica vazia, a lista 3 assume todos os valores da lista 2. A partir daí, todos os valores que estavam 
 % guardados algures (Ha), serão adicionador ao resto da lita 3 (inicio da linha 73)



apagaOco(_,[ ],[ ]).
apagaOco(X,[X|L],M):-!,apagaOco(X,L,M).
apagaOco(X,[Y|L],[Y|M]):-apagaOco(X,L,M). % é aqui que é preenchida a lista mais à direita. ATENTO AO Y!

% Concatena
concatena([],L,L).
concatena([X|L1],L2,[X|L]):-concatena(L1,L2,L).

% Flatten
flatten2([],[]).
flatten2([[H|T]|L],LF):-!,append([H|T],L,L1),flatten2(L1,LF).
flatten2([X|L],[X|LF]):-flatten2(L,LF).

% Substituir todas as ocorrencias de um elemento por outro elemento

substituir(_,_,[],[]).
substituir(X,Y,[X|T],L):-substituir(X,Y,[Y|T],L).
substituir(X,Y,[Hx|Tx],[Hx|Ty]):-substituir(X,Y,Tx,Ty).

% Inserir um elemento numa dada posição na lista


inserir(Num,0,L,[Num|L]).
inserir(Num,Pos,[Hx|Tx],[Hx|Ty]):- Pos1 is Pos - 1, inserir(Num, Pos1, Tx, Ty).



% Inverter
inverter(A,B):-inverter1(A,[],B,_), write('Final').

inverter1([],L,L,_).
inverter1([Ha|Ta], B, C,_):- inverter1(Ta, [Ha|B], C, Ha), write(B).
