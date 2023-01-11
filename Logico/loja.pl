:- include('util.pl').
:- include('menu.pl').


loja :-
    clearScr,
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


navegacaoLoja(1) :- compra, menu.
navegacaoLoja(2) :- venda, menu.
navegacaoLoja(3) :- menu.
navegacaoLoja(_) :- write("Digite uma opção válida\n"), entradaLoja.


compra :- 
    mensagemCompra,
    read(Quantidade),
    (Quantidade > 0 -> write('valida compra');
    write('Quantidade inválida')).


venda :-
    mensagemVender,
    read(Quantidade),
    (Quantidade > 0 -> wrtie('valida venda');
    write('Quantidade inválida')).


