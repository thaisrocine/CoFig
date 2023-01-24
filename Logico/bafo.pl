:- include('util.pl').

bafo :- 
    shell(clear),
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


mensagemApostar :- 
    writeln("                                                              "),
    writeln(" <<Digite a quantidade de figurinhas que deseja apostar>>     "),
    writeln("                                                              "),
    writeln(" >> Quantidade:                                               ").

entradaBafo :-
    read(Opc),
    navegacaoBafo(Opc).


navegacaoBafo(1) :- mensagemApostar.
navegacaoBafo(2) :- write('').
navegacaoBafo(_) :- write("Digite uma opção válida\n"), entradaBafo.
