:- include('util.pl').
:- include('album.pl').

run :- 
    logo,
    mensagemInicial.

logo :-
    clearScr,
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
    read(Opc),
    iniciaJogo(Opc).


iniciaJogo(1):- menu, menuPrincipal.
iniciaJogo(2):- write("encerrar").
iniciaJogo(_):- write("Digite uma opção válida\n"), entradaIniciaJogo, halt.



menu :-
    clearScr,
    writeln("        ================================================      "),
    writeln("             ███╗   ███╗███████╗███╗   ██╗██╗   ██╗           "),
    writeln("             ████╗ ████║██╔════╝████╗  ██║██║   ██║           "),
    writeln("             ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║           "),
    writeln("             ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║           "),
    writeln("             ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝           "),
    writeln("             ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝            "),
    writeln("        ================================================      ").



menuPrincipal :-
    writeln("                                               "),
    writeln("                             1. ALBUM          "),
    writeln("                             2. LOJA           "),
    writeln("                             3. BAFO           "),
    writeln("                             4. FINALIZAR      "),
    writeln("                                               "),
    entradaMenuPrincipal.


entradaMenuPrincipal:- 
    read(Opc),
    navegacaoMenu(Opc).

navegacaoMenu(1):- album, menu.
navegacaoMenu(2):- loja, menu.
navegacaoMenu(3):- bafo, menu.
navegacaoMenu(4):- halt.
navegacaoMenu(_):- write("Digite uma opção válida\n"), entradaMenuPrincipal.
