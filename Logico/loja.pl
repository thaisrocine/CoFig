:- include('util.pl').

loja :-
    shell(clear),
    writeln("        =============================================      "),
    writeln("             ██╗      ██████╗      ██╗ █████╗              "),
    writeln("             ██║     ██╔═══██╗     ██║██╔══██╗             "),
    writeln("             ██║     ██║   ██║     ██║███████║             "),
    writeln("             ██║     ██║   ██║██   ██║██╔══██║             "),
    writeln("             ███████╗╚██████╔╝╚█████╔╝██║  ██║             "),
    writeln("             ╚══════╝ ╚═════╝  ╚════╝ ╚═╝  ╚═╝             "),
    writeln("        =============================================      "),
    menuLoja.

menuLoja :-
    getDinheiro(Dinheiro), getRepetidas(Repetidas), write("Dinheiro: "), write(Dinheiro), write("  Repetidas: "), writeln(Repetidas),
    writeln("                                                        "),
    writeln("                     1. COMPRAR PACOTINHOS              "),
    writeln("                     2. VENDER REPETIDAS                "),
    writeln("                     3. MENU INICIAL                    "),
    writeln("                                                        "),
    entradaLoja.

entradaLoja:-
    read_line_to_string(user_input, Opc),
    navegacaoLoja(Opc).

mensagemCompra :- 
    writeln("                                                              "),
    writeln(" <<Digite a quantidade de pacotinhos que você deseja comprar>>"),
    writeln("                                                              "),
    writeln(" >> Quantidade:                                               ").

mensagemVender :- 
    writeln("                                                              "),
    writeln(" <<Digite a quantidade de figurinhas que você deseja vender>> "),
    writeln("                                                              "),
    writeln(" >> Quantidade:                                               ").

navegacaoLoja("1"):- compra, loja.
navegacaoLoja("2"):- venda, loja.
navegacaoLoja("3"):- write('').
navegacaoLoja(_):- write("Digite uma opção válida\n"), entradaLoja.

compra :- 
    mensagemCompra,
    read_line_to_string(user_input, QuantidadeS),
    string_to_atom(QuantidadeS,QuantidadeA),
    atom_number(QuantidadeA,Quantidade),
    (Quantidade > 0 -> validaCompra(Quantidade);
    writeln('Quantidade inválida'), continuar).

validaCompra(Quantidade) :-
    getDinheiro(Dinheiro), 
    getRepetidas(Repetidas)
    ,((Dinheiro + Repetidas) < 5 ->
        mensagemSemDinheiroSemRepetida, read_line_to_string(user_input, AcrescimoS),
        string_to_atom(AcrescimoS, AcrescimoA), atom_number(AcrescimoA, Acrescimo), 
        acrescentaDinheiro(Acrescimo) 
        ; (Quantidade * 5) > Dinheiro -> mensagemSemDinheiro ; realizaCompra(Quantidade)), continuar.

realizaCompra(Quantidade) :- 
    decrementaDinheiro(Quantidade),
    gerarPacotinho(Quantidade, Figurinhas),
    write("Figurinhas ganhas: "),
    writeln(Figurinhas),
    writeln("Colando Figurinhas"),
    marcarAlbum(Figurinhas),
    writeln("Figurinhas Coladas").

venda :-
    mensagemVender,
    read_line_to_string(user_input, QuantidadeS),
    string_to_atom(QuantidadeS,QuantidadeA),
    atom_number(QuantidadeA,Quantidade),
    (Quantidade > 0 -> validaVenda(Quantidade);
    writeln('Quantidade inválida'), continuar).

validaVenda(Quantidade) :-
    getRepetidas(Repetidas),
    (Quantidade =< Repetidas -> 
    decrementaRepetidas(Quantidade),
    acrescentaDinheiro(Quantidade);
    mensagemSemRepetidas, 
    continuar).