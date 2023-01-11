clearScr :- write('\33\[2J').


lerArquivo(FilePath, Dados):-
    open(FilePath,read,F),
    ler_dados(F,Dados),
    close(F).
   
ler_dados(F,[]):-
    at_end_of_stream(F).
   
ler_dados(F,[X|L]):-
    \+  at_end_of_stream(F),
    read(F,X),
    ler_dados(F,L).


getDinheiro :-
    lerArquivo('arquivos/dinheiro.txt', Dados),
    write(Dados).


getRepetidas :-
    lerArquivo('arquivos/repetidas.txt', Dados),
    write(Dados).


getAlbum :-
    lerArquivo('arquivos/album.txt', Dados),
    write(Dados).


