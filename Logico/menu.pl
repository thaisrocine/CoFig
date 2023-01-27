:- include('loja.pl').
:- include('album.pl').
:- include('bafo.pl').
:- include('util.pl').

run :- 
    logo,
    mensagemInicial.

logo :-
    shell(clear),
    writeln("        =============================================      "),
    writeln("              ██████╗ ██████╗ ███████╗██╗ ██████╗          "),
    writeln("             ██╔════╝██╔═══██╗██╔════╝██║██╔════╝          "),
    writeln("             ██║     ██║   ██║█████╗  ██║██║  ███╗         "),
    writeln("             ██║     ██║   ██║██╔══╝  ██║██║   ██║         "),
    writeln("             ╚██████╗╚██████╔╝██║     ██║╚██████╔╝         "),
    writeln("              ╚═════╝ ╚═════╝ ╚═╝     ╚═╝ ╚═════╝          "),
    writeln("        =============================================      ").


mensagemInicial :-
    writeln("                                                                "),
    writeln("  <<Seja bem vindo ao seu simulador de Álbum da Copa do Mundo>> "),
    writeln("                       <<Deseja iniciar?>>                      "),
    writeln("                              1.SIM                             "),
    writeln("                              2.NÃO                             "),
    writeln("                                                                "),
    entradaIniciaJogo.

entradaIniciaJogo :- 
    read_line_to_string(user_input, Opcs),
    string_to_atom(Opcs,Opca),
    atom_number(Opca,Opc),
    iniciaJogo(Opc).


iniciaJogo(1):- menu.
iniciaJogo(2):- halt.
iniciaJogo(_):- write("Digite uma opção válida\n"), entradaIniciaJogo, halt.



menu :-
    shell(clear),
    writeln("                                                              "),
    writeln("        ================================================      "),
    writeln("             ███╗   ███╗███████╗███╗   ██╗██╗   ██╗           "),
    writeln("             ████╗ ████║██╔════╝████╗  ██║██║   ██║           "),
    writeln("             ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║           "),
    writeln("             ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║           "),
    writeln("             ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝           "),
    writeln("             ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝            "),
    writeln("        ================================================      "),
    menuPrincipal.



menuPrincipal :-
    getDinheiro(Dinheiro), getRepetidas(Repetidas), write("Dinheiro: "), write(Dinheiro), write("  Repetidas: "), writeln(Repetidas),
    writeln("                                               "),
    writeln("                             1. ALBUM          "),
    writeln("                             2. LOJA           "),
    writeln("                             3. BAFO           "),
    writeln("                             4. FINALIZAR      "),
    writeln("                                               "),
    entradaMenuPrincipal.


entradaMenuPrincipal:- 
    read_line_to_string(user_input, Opcs),
    string_to_atom(Opcs,Opca),
    atom_number(Opca,Opc),
    navegacaoMenu(Opc).

navegacaoMenu(1) :- album, menu.
navegacaoMenu(2) :- loja, menu.
navegacaoMenu(3) :- bafo, menu.
navegacaoMenu(4) :- halt.
navegacaoMenu(_) :- write("Digite uma opção válida\n"), entradaMenuPrincipal.
