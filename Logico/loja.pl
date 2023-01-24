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


navegacaoLoja(1) :- compra.
navegacaoLoja(2) :- venda.
navegacaoLoja(3) :- write('').
navegacaoLoja(_) :- write("Digite uma opção válida\n"), entradaLoja.


compra :- 
    mensagemCompra,
    read(Quantidade),
    getDinheiro(Dinheiro), 
    getRepetidas(Repetidas),
    (Quantidade > 0 -> validaCompra(Quantidade, Dinheiro, Repetidas);
    write('Quantidade inválida')).


validaCompra(Quantidade, Dinheiro, Repetidas) :-
    Dinheiro < 5, Repetidas < 5,
    mensagemSemDinheiroSemRepetida, 
    acrescentaDinheiro.


venda :-
    mensagemVender,
    read(Quantidade),
    (Quantidade > 0 -> write('valida venda');
    write('Quantidade inválida')).

