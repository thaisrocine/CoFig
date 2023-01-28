:- initialization(main).
:- include('menu.pl').

main :- 
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
    read_line_to_string(user_input, Opc),
    iniciaJogo(Opc).


iniciaJogo("1"):- menu.
iniciaJogo("2"):- halt.
iniciaJogo(_):- write("Digite uma opção válida\n"), entradaIniciaJogo.