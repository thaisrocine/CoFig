:- include('loja.pl').
:- include('album.pl').
:- include('bafo.pl').
:- include('util.pl').

finalizaJogo :-
getAlbum(Album),
contaFigurinhas(Album, Possui, NPossui),
(NPossui == 0 ->
writeln("\nParabéns, você conseguiu todas as figurinhas!"),continuar,halt;
writeln("")
).

menu :-

    finalizaJogo,shell(clear),
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
    read_line_to_string(user_input, Opc),
    navegacaoMenu(Opc).

navegacaoMenu("1") :- album, menu.
navegacaoMenu("2") :- loja, menu.
navegacaoMenu("3") :- bafo, menu.
navegacaoMenu("4") :- halt.

navegacaoMenu(_) :- write("Digite uma opção válida\n"), entradaMenuPrincipal.
