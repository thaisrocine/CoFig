:- include('util.pl').
:- include('menu.pl').


bafo :- 
    clearScr,
    writeLn("        =============================================      "),
    writeLn("             ██████╗  █████╗ ███████╗ ██████╗              "),
    writeLn("             ██╔══██╗██╔══██╗██╔════╝██╔═══██╗             "),
    writeLn("             ██████╔╝███████║█████╗  ██║   ██║             "),
    writeLn("             ██╔══██╗██╔══██║██╔══╝  ██║   ██║             "),
    writeLn("             ██████╔╝██║  ██║██║     ╚██████╔╝             "),
    writeLn("             ╚═════╝ ╚═╝  ╚═╝╚═╝      ╚═════╝              "),
    writeLn("        =============================================      "),
    menuBafo.


menuBafo :- 
    writeLn("                                              "),
    writeLn("                  1. APOSTAR FIGURINHAS       "),
    writeLn("                  2. MENU INICIAL             "),
    writeLn("                                              "),
    entradaBafo.


entradaBafo :-
    read(Opc),
    navegacaoBafo(Opc).


navegacaoBafo(1) :- write('apostar'), menu.
navegacaoBafo(2) :- menu.
navegacaoBafo(_) :- write("Digite uma opção válida\n"), entradaBafo.
