:-include('util.pl').

album :-
    shell(clear),
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
    read_line_to_string(user_input, Opcs),
    string_to_atom(Opcs,Opca),
    atom_number(Opca,Opc),
    navegacaoAlbum(Opc).


navegacaoAlbum(1):- estatistica, album.
navegacaoAlbum(2):- write('').
navegacaoAlbum(_):- write("Digite uma opção válida\n"), entradaAlbum.

estatistica :-
    shell(clear),
    getAlbum(Album),
    writeln("                                                        "),
    writeln("                 <<ESTATÍSTICAS>>                       "),
    writeln("                                                        \n"),
    writeln("        <<Quantidade de Figurinhas coladas>>            \n"),
    contaVerdadeiro(Album, V),
    writeln(V),
    writeln("        <<Quantidade de Figurinhas faltantes>>            \n"),
    contaFalso(Album, F),
    writeln(F),
    writeln("        <<Porcentagem figurinhas no álbum (%)>>          \n"),
    P is (V / 250) * 100,
    format('~2f', [P]),
    writeln("\n\n"),
    continuar.




contaVerdadeiro([], 0).
contaVerdadeiro([true|T], C):- contaVerdadeiro(T,C1), C is C1 + 1.
contaVerdadeiro([_|T], C):- contaVerdadeiro(T,C).

contaFalso([], 0).
contaFalso([false|T], C):- contaFalso(T,C1), C is C1 + 1.
contaFalso([_|T], C):- contaFalso(T,C).