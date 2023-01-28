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
    getDinheiro(Dinheiro), getRepetidas(Repetidas), write("Dinheiro: "), write(Dinheiro), write("  Repetidas: "), writeln(Repetidas),
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
    (Quantidade > 0 -> validaAposta(Quantidade), continuar;
    writeln('Quantidade inválida'), continuar).

validaAposta(Quantidade) :- 
    getRepetidas(Repetidas),
    (Quantidade > Repetidas -> mensagemSemRepetidas;
    Limite is Quantidade + 3, random(1, Limite, QtdBot),write('Quantidade apostada pelo bot: '),
    writeln(QtdBot), decrementaRepetidas(Quantidade), QtdApostada is QtdBot + Quantidade,
    apostaBafo(QtdApostada, QtdGanha), randomNum(QtdGanha, 251, Figurinhas),
    write('As Figurinhas ganhas por você foram: '), writeln(Figurinhas),
    writeln("Colando Figurinhas"), marcarAlbum(Figurinhas), writeln("Figurinhas Coladas")).

apostaBafo(QtdApostada, QtdGanha) :-
    writeln("Presione 'Enter' para bater figurinha"), read_line_to_string(user_input, X), random(0, QtdApostada, QtdGanha),
    write("Quantidade de figurinhas viradas por você: "), writeln(QtdGanha), Restante is (QtdApostada - QtdGanha) + 1, random(0, Restante, QtdBot),
    write("Quantidade de figurinhas viradas pelo Bot: "), writeln(QtdBot), Perdidas is Restante - QtdBot - 1,
    write("Figurinhas perdidas por você e o bot: "), writeln(Perdidas).