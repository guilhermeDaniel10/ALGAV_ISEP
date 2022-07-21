liga(a,c).
liga(c,g).


liga(a,b).
% liga(a,c).
liga(a,d).
liga(b,e).
liga(b,f).
liga(c,f).
% liga(c,g).
liga(d,a).
liga(d,g).
liga(d,h).
liga(d,i).
liga(e,j).
liga(f,a).
liga(f,j).
liga(f,k).
liga(g,f).
liga(g,o).
liga(g,h).
liga(h,d).
liga(h,l).
liga(i,l).
liga(j,m).
liga(j,n).
liga(k,n).
liga(k,p).
liga(l,p).


% DFS ou Primeiro em Profundidade

dfs(Origem, Destino, Caminho):- dfs2(Origem, Destino, [Origem], Caminho).

dfs2(Destino, Destino, TempL, Caminho):- reverse(TempL, Caminho). % é necessário reverter porque a lista está a ser preenchida pela cabeça
dfs2(Atual, Destino, TempL, Caminho):- liga(Atual, X), \+ member(X, TempL), dfs2(X, Destino, [X|TempL], Caminho).
% a variavel X é criada de tal modo que é instanciada ao primeiro valor da BC de liga ao ponto atual


% Todas as solucoes numa lista

junta(Origem, Destino, CaminhoFinal):- findall(Caminho, dfs(Origem, Destino, Caminho), CaminhoFinal). % O primeiro elemento é o que se quer guardar, como se quer guardar uma lista, guarda-se Caminho

% Implementar a solucao que passar por menos nos  


melhorCaminho(Origem, Destino, Caminho):- junta(Origem, Destino, LCaminho), menor(LCaminho, Caminho,_).

menor([L],L,N):-!, length(L, N).
menor([L|LL],Lm,Nm):-menor(LL, Lm1, Nm1), length(L, NL), ((NL< Nm1, !, Lm=L, Nm is NL);(Lm=Lm1, Nm is Nm1)).

% DFS com niveis de corte

corte(Origem, Destino, Caminho, Nivel):- corte2(Origem, Destino, [Origem], Caminho, Nivel).

corte2(Destino, Destino, LTemp, Final,_):- reverse(LTemp, Final).
corte2(Atual, Destino, LTemp, Final, Nivel):- Nivel > 0, liga(Atual,X), \+ member(X,LTemp), Nivel1 is Nivel - 1, 
corte2(X, Destino, [X|LTemp], Final, Nivel1).

% BFS ou Primeiro em Largura

