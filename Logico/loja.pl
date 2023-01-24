:- include('util.pl').

loja :-
    shell(clear),
    writeln("        =============================================      "),
    writeln("             ██╗      ██████╗      ██╗ █████╗              "),
    writeln("             ██║     ██╔═══██╗     ██║██╔══██╗             "),
    writeln("             ██║     ██║   ██║     ██║███████║             "),
    writeln("             ██║     ██║   ██║██   ██║██╔══██║             "),
    writeln("             ███████╗╚██████╔╝╚█████╔╝██║  ██║             "),
    writeln("             ╚══════╝ ╚═════╝  ╚════╝ ╚═╝  ╚═╝             "),
    writeln("        =============================================      "),
    menuLoja.


menuLoja :-
    writeln("                                                        "),
    writeln("                     1. COMPRAR PACOTINHOS              "),
    writeln("                     2. VENDER REPETIDAS                "),
    writeln("                     3. MENU INICIAL                    "),
    writeln("                                                        "),
    entradaLoja.


entradaLoja:-
    read(Opc),
    navegacaoLoja(Opc).


mensagemCompra :- 
    writeln("                                                              "),
    writeln(" <<Digite a quantidade de pacotinhos que você deseja comprar>>"),
    writeln("                                                              "),
    writeln(" >> Quantidade:                                               ").


mensagemVender :- 
    writeln("                                                              "),
    writeln(" <<Digite a quantidade de figurinhas que você deseja vender>> "),
    writeln("                                                              "),
    writeln(" >> Quantidade:                                               ").


navegacaoLoja(1):- compra, loja.
navegacaoLoja(2):- venda, loja.
navegacaoLoja(3):- write('').
navegacaoLoja(_):- write("Digite uma opção válida\n"), entradaLoja.


compra :- 
    mensagemCompra,
    read(Quantidade),
    (Quantidade > 0 -> write('valida compra');
    write('Quantidade inválida')).


validaCompra(Quantidade) :-
    getDinheiro(Dinheiro), 
    getRepetidas(Repetidas),
    Dinheiro < 5, Repetidas < 5,
    mensagemSemDinheiroSemRepetida.


venda :-
    mensagemVender,
    read(Quantidade),
    (Quantidade > 0 -> write('valida venda');
    write('Quantidade inválida')).


validaVenda(Quantidade) :-
    getRepetidas(Repetidas),
    (Quantidade =< Repetidas -> decrementaRepetidas(Quantidade);
    mensagemSemRepetidas).

    

