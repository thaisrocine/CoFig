:- use_module(library(random)).

lerArquivo(FilePath, Dados):-
    open(FilePath,read,F),
    ler_dados(F,Dados), !,
    close(F).
   
ler_dados(F,[]):-
    at_end_of_stream(F).

ler_dados(F,[X|L]):-
    \+  at_end_of_stream(F),
    read(F,X),
    ler_dados(F,L).

alteraArquivo(FilePath, NovoValor) :-
    tell(FilePath),
    write(NovoValor), write('.'),
    told.

getDinheiro(R) :-
    lerArquivo('arquivos/dinheiro.txt', Dados),
    last(Dados, R).

getRepetidas(R) :-
    lerArquivo('arquivos/repetidas.txt', Dados),
    last(Dados, R).

getAlbum(A) :- csv_read_file('arquivos/album.csv', A).

randomNum(Quantidade, Limite, Lista) :- randseq(Quantidade, Limite, Lista).

gerarPacotinho(Quantidade, Figurinhas) :- 
    NewQtde is Quantidade * 5,
    randomNum(NewQtde, 251, Figurinhas).

continuar :- 
    writeln("Presione 'Enter' para continuar"),
    read_line_to_string(user_input, X),
    writeln('').

mensagemSemRepetidas :- 
    writeln("                                                                "),
    writeln(" <<Parece que você está sem figurinhas repetidas Suficiente>>   "),
    writeln("             <<Volte quando tiver pelo menos uma>>              "),
    writeln("                                                                ").

mensagemSemDinheiroSemRepetida :- 
    writeln("                                                                                      "),
    writeln("      <<Que pena, parece que você está sem dinhero e sem figurinhas repetidas>>       "),
    writeln("                     <<Para continuar jogando insira um valor>>                       "),
    writeln("                                                                                      "),
    writeln(" >> Valor:                                                                            ").

mensagemSemDinheiro :- 
    writeln("                                                                       "),
    writeln("      <<Que pena, parece que você não possui dinhero suficente>>       "),
    writeln(" <<Para continuar venda figurinhas repetidas para conseguir dinheiro>> "),
    writeln("                                                                       ").

acrescentaDinheiro(Acrescimo) :-
    getDinheiro(Atual),
    NovoValor is Atual + Acrescimo,
    alteraArquivo('arquivos/dinheiro.txt', NovoValor).

decrementaDinheiro(Quantidade) :-
    getDinheiro(Atual),
    NovoValor is Atual - (Quantidade * 5),
    alteraArquivo('arquivos/dinheiro.txt', NovoValor).

acrescentaRepetidas :-
    getRepetidas(Atual),
    NovoValor is Atual + 1,
    alteraArquivo('arquivos/repetidas.txt', NovoValor).

decrementaRepetidas(Quantidade) :- 
    getRepetidas(Atual),
    NovoValor is Atual - Quantidade,
    alteraArquivo('arquivos/repetidas.txt', NovoValor).

verificaDinheiroERepetida :-
    getDinheiro(Dinheiro),
    getRepetidas(Repetidas),
    Dinheiro =< 0, Repetidas =< 0,
    acrescentaDinheiro.

marcarAlbum([]).

marcarAlbum([H|T]) :-
    atualizaAlbum(H),
    marcarAlbum(T).

atualizaAlbum(Id) :-
    csv_read_file('arquivos/album.csv', A),
    atualizaAlbumAux(A, Id, Saida),
    csv_write_file('arquivos/album.csv', Saida).

atualizaAlbumAux([], _, []).
atualizaAlbumAux([row(Id, true)| T], Id, [row(Id, true)| T]) :- write(Id), writeln(' é repetida'), acrescentaRepetidas.
atualizaAlbumAux([row(Id, false)| T], Id, [row(Id, true)| T]).
atualizaAlbumAux([H| T], Id, [H| Saida]) :- atualizaAlbumAux(T, Id, Saida).
