:- use_module(library(random)).


clearScr :- write('\33\[2J').


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


getAlbum(R) :- lerArquivo('arquivos/album.txt', R).


randomNum(Quantidade, Limite, Lista) :- randseq(Quantidade, Limite, Lista).


gerarPacotinho(Quantidade, Figurinhas) :- randomNum(Quantidade * 5, 251, Figurinhas).


mensagemTemRepetida :-
    writeln("                                                                "),
    writeln("         <<Você ainda possui figurinhas repetidas>>             "),
    writeln("    <<Você pode vendê-las para conseguir mais dinheiro>>        "),
    writeln("                                                                ").

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


acrescentaDinheiro :-
    getDinheiro(Atual),
    read(Acrescimo),
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


verificaDinheiroERepetida :-
    getDinheiro(Dinheiro),
    getRepetidas(Repetidas),
    Dinheiro =< 0, Repetidas =< 0,
    acrescentaDinheiro.
