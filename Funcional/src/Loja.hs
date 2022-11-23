module Loja
  (loja,
  )
where


import System.IO
import System.Random 
import System.IO.Strict as S
import System.Directory


import Util



loja :: IO ()
loja = do
  clearScr
  putStrLn "        =============================================      "
  putStrLn "             ██╗      ██████╗      ██╗ █████╗ "
  putStrLn "             ██║     ██╔═══██╗     ██║██╔══██╗"
  putStrLn "             ██║     ██║   ██║     ██║███████║"
  putStrLn "             ██║     ██║   ██║██   ██║██╔══██║"
  putStrLn "             ███████╗╚██████╔╝╚█████╔╝██║  ██║"
  putStrLn "             ╚══════╝ ╚═════╝  ╚════╝ ╚═╝  ╚═╝"
  putStrLn "        =============================================      "
  menuLoja

menuLoja :: IO ()
menuLoja = do
  putStrLn "                                                        "
  putStrLn "                     1. COMPRAR PACOTINHOS              "
  putStrLn "                     2. VENDER REPETIDAS                "
  putStrLn "                     3. MENU INICIAL                    "
  putStrLn "                                                        "
  entradaLoja


mensagemCompra :: IO()
mensagemCompra = do
  putStrLn "                                                              "
  putStrLn " <<Digite a quantidade de pacotinhos que você deseja comprar>>"
  putStrLn "                                                              "
  putStrLn " >> Quantidade:                                               "


entradaLoja :: IO()
entradaLoja = do
  opc <- getLine :: IO String
  navegacaoLoja opc


navegacaoLoja :: String -> IO()
navegacaoLoja opc
  | opc == "1" = compra
  | opc == "2" = venda
  | opc == "3" = putStrLn " "
  | otherwise = do
    putStr "\nDigite uma opção válida\n"
    entradaLoja


venda :: IO()
venda = do
  if (verificaQuantidadeRepetidas 1) then do
    putStrLn "VENDENDO"
    c <- getLine :: IO String
    putStrLn ""
  else
    mensagemSemRepetidas


compra :: IO()
compra = do
  conteudo <- lerArquivo "/src/arquivos/dinheiro.txt"
  let valor = toInt (head conteudo)
  mensagemCompra
  quantidade <- readLn :: IO Int
  -- validar entrada (numero negativo)
  validacao quantidade valor 0    -- alterar o numero de repetidas



validacao :: Int -> Int -> Int -> IO()
validacao qtdeCompra dinheiro repetidas
  | verificaValor qtdeCompra dinheiro = realizaCompra qtdeCompra dinheiro
  | verificaQuantidadeRepetidas repetidas = do 
    mensagemTemRepetidas
    c <- getLine :: IO String
    putStrLn ""
  | otherwise = do
    mensagemSemDinheiro
    acrescentaDinheiro


realizaCompra :: Int -> Int -> IO()
realizaCompra quantidade valor = do
  let novo_valor = decrementaDinheiro quantidade valor
  alteraDinheiro novo_valor
  randomFig quantidade
  putStrLn "Compra realizada com sucesso"
  c <- getLine :: IO String --continuar
  putStrLn ""


decrementaDinheiro :: Int -> Int -> Int
decrementaDinheiro quantidade valor = valor - (quantidade * 5)


acrescentaDinheiro :: IO()
acrescentaDinheiro = do
  conteudo <- lerArquivo "/src/arquivos/dinheiro.txt"
  let valor = toInt (head conteudo)
  acrescimo <- readLn :: IO Int
  alteraDinheiro (acrescimo + valor)


randomNumbers :: Int -> Int ->StdGen-> IO()
randomNumbers quantFig quantMaxFig g = print $ take quantFig (randomRs (1,quantMaxFig::Int) g)


randomFig:: Int->IO()
randomFig quant = do
    g <-  newStdGen
    randomNumbers (quant*5) 250 g