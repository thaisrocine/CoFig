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
  if (verificaRepetidas 1) then do
    putStrLn "VENDENDO"
    c <- getLine :: IO String
    putStrLn ""
  else
    mensagemSemRepetidas


compra :: IO()
compra = do
  exedir <- getCurrentDirectory
  meu_arquivo <- openFile (exedir ++ "/src/arquivos/dinheiro.txt") ReadMode
  conteudo <- S.hGetContents meu_arquivo
  let valor = toInt (conteudo)
  mensagemCompra
  quantidade <- readLn :: IO Int
  -- validar entrada (numero negativo)

  if (verificaValor quantidade valor) then 
    realizaCompra quantidade valor
  else do
    mensagemSemDinheiro
    acrescentaDinheiro



realizaCompra :: Int -> Int -> IO()
realizaCompra quantidade valor = do
  let novo_valor = decrementaDinheiro quantidade valor
  alteraDinheiro novo_valor
  randomNumbers quantidade
  putStrLn "Compra realizada com sucesso"
  c <- getLine :: IO String --continuar
  putStrLn ""


decrementaDinheiro :: Int -> Int -> Int
decrementaDinheiro quantidade valor = valor - (quantidade * 5)


acrescentaDinheiro :: IO()
acrescentaDinheiro = do
  exedir <- getCurrentDirectory
  meu_arquivo <- openFile (exedir ++ "/src/arquivos/dinheiro.txt") ReadMode
  conteudo <- S.hGetContents meu_arquivo
  let valor = toInt (conteudo)
  acrescimo <- readLn :: IO Int
  alteraDinheiro (acrescimo + valor)


randomFig :: Int -> Int ->StdGen-> IO()
randomFig quantFig quantMaxFig g = print $ take quantFig (randomRs (1,quantMaxFig::Int) g)


randomNumbers:: Int->IO()
randomNumbers quant = do
    g <-  newStdGen
    randomFig (quant*5) 250 g
    exedir <- getCurrentDirectory
    arq <- openFile (exedir ++"/src/arquivos/figurinhasCompradas.csv") AppendMode
    hPutStr arq (show (take (quant* 5) (randomRs (1, 250::Int) g)) ++ "\n")
    hFlush arq 
    hClose arq