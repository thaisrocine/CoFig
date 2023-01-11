:- include('util.pl').
:- include('menu.pl').


loja :-
    clearScr,
    writeLn("        =============================================      "),
    writeLn("             ██╗      ██████╗      ██╗ █████╗              "),
    writeLn("             ██║     ██╔═══██╗     ██║██╔══██╗             "),
    writeLn("             ██║     ██║   ██║     ██║███████║             "),
    writeLn("             ██║     ██║   ██║██   ██║██╔══██║             "),
    writeLn("             ███████╗╚██████╔╝╚█████╔╝██║  ██║             "),
    writeLn("             ╚══════╝ ╚═════╝  ╚════╝ ╚═╝  ╚═╝             "),
    writeLn("        =============================================      "),
    menuLoja.


menuLoja :-
  writeLn("                                                        "),
  writeLn("                     1. COMPRAR PACOTINHOS              "),
  writeLn("                     2. VENDER REPETIDAS                "),
  writeLn("                     3. MENU INICIAL                    "),
  writeLn("                                                        "),
  entradaLoja.


entradaLoja:-
    read(Opc),
    navegacaoLoja(Opc).


navegacaoLoja(1) :- write('compra'), menu.
navegacaoLoja(2) :- write('venda'), menu.
navegacaoLoja(3) :- menu.
navegacaoLoja(_) :- write("Digite uma opção válida\n"), entradaLoja.



