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


navegacaoLoja(1) :- write('compra'), menu.
navegacaoLoja(2) :- write('venda'), menu.
navegacaoLoja(3) :- menu.
navegacaoLoja(_) :- write("Digite uma opção válida\n"), entradaLoja.



