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
    read_line_to_string(user_input, Opc),
    navegacaoAlbum(Opc).


navegacaoAlbum("1"):- estatistica, album.
navegacaoAlbum("2"):- write('').
navegacaoAlbum(_):- write("Digite uma opção válida\n"), entradaAlbum.

estatistica :-
    shell(clear),
    getAlbum(Album),
    contaFigurinhas(Album, Possui, NPossui),
    writeln("                                                        "),
    writeln("                 <<ESTATÍSTICAS>>                       "),
    writeln("                                                        \n"),
    writeln("        <<Quantidade de Figurinhas coladas>>            \n"),
    writeln(Possui),
    writeln("        <<Quantidade de Figurinhas faltantes>>            \n"),
    writeln(NPossui),
    writeln("        <<Porcentagem figurinhas no álbum (%)>>          \n"),
    P is (Possui / 250) * 100,
    format('~2f', [P]),
    writeln("\n\n"),
    continuar.

contaFigurinhas([], 0, 0).
contaFigurinhas([row(_, true)|T], V, F):- contaFigurinhas(T, V1, F), V is V1 + 1.
contaFigurinhas([row(_, false)|T], V, F):- contaFigurinhas(T, V, F1), F is F1 + 1.