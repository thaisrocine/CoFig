:- include('util.pl').
:- include('menu.pl').


bafo :- 
    clearScr,
    writeln("        =============================================      "),
    writeln("             ██████╗  █████╗ ███████╗ ██████╗              "),
    writeln("             ██╔══██╗██╔══██╗██╔════╝██╔═══██╗             "),
    writeln("             ██████╔╝███████║█████╗  ██║   ██║             "),
    writeln("             ██╔══██╗██╔══██║██╔══╝  ██║   ██║             "),
    writeln("             ██████╔╝██║  ██║██║     ╚██████╔╝             "),
    writeln("             ╚═════╝ ╚═╝  ╚═╝╚═╝      ╚═════╝              "),
    writeln("        =============================================      "),
    menuBafo.


menuBafo :- 
    writeln("                                              "),
    writeln("                  1. APOSTAR FIGURINHAS       "),
    writeln("                  2. MENU INICIAL             "),
    writeln("                                              "),
    entradaBafo.


entradaBafo :-
    read(Opc),
    navegacaoBafo(Opc).


navegacaoBafo(1) :- write('apostar'), menu.
navegacaoBafo(2) :- menu.
navegacaoBafo(_) :- write("Digite uma opção válida\n"), entradaBafo.
