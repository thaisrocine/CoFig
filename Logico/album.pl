:- include('util.pl').
:- include('menu.pl').

album :-
    clearScr,
    writeln("          ======================================================      "),
    writeln("                █████╗ ██╗     ██████╗ ██╗   ██╗███╗   ███╗           "),
    writeln("               ██╔══██╗██║     ██╔══██╗██║   ██║████╗ ████║           "),
    writeln("               ███████║██║     ██████╔╝██║   ██║██╔████╔██║           "),
    writeln("               ██╔══██║██║     ██╔══██╗██║   ██║██║╚██╔╝██║           "),
    writeln("               ██║  ██║███████╗██████╔╝╚██████╔╝██║ ╚═╝ ██║           "),
    writeln("               ╚═╝  ╚═╝╚══════╝╚═════╝  ╚═════╝ ╚═╝     ╚═╝           "),
    writeln("          ======================================================      "),
    menuAlbum.


menuAlbum :-
    writeln("                                                            "),
    writeln("                           1. ESTATISTICAS                  "),
    writeln("                           2. MENU INICIAL                  "),
    writeln("                                                            "),
    entradaAlbum.


entradaAlbum:-
    read(Opc),
    navegacaoAlbum(Opc).


navegacaoAlbum(1):- write('estatistica').
navegacaoAlbum(2):- menu.
navegacaoAlbum(_):- write("Digite uma opção válida\n"), entradaAlbum.

