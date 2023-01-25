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
    read_line_to_string(user_input, Opcs),
    string_to_atom(Opcs,Opca),
    atom_number(Opca,Opc),
    navegacaoBafo(Opc).

navegacaoBafo(1) :- apostar, bafo.
navegacaoBafo(2) :- write('').
navegacaoBafo(_) :- write("Digite uma opção válida\n"), entradaBafo.

apostar :- 
    mensagemApostar,
    read_line_to_string(user_input, QuantidadeS),
    string_to_atom(QuantidadeS,QuantidadeA),
    atom_number(QuantidadeA,Quantidade),
    (Quantidade > 0 -> write('valida aposta');
    write('Quantidade inválida')).

