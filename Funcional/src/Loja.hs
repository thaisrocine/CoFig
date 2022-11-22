module Loja
  (loja,
  )
where


import System.IO

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
  else 
    mensagemSemRepetidas  

compra :: IO()
compra = do
  meu_arquivo <- openFile "./arquivos/dinheiro.txt" ReadMode
  conteudo <- hGetContents meu_arquivo
  let valor = (toInt conteudo)
  mensagemCompra
  quantidade <- readLn :: IO Int
  -- validar entrada (numero negativo)

  if (verificaValor quantidade valor) then 
    realizaCompra quantidade valor
  else 
    addDinheiro



realizaCompra :: Int -> Int -> IO()
realizaCompra quantidade valor = do
  arq <- openFile "./arquivos/dinheiro.txt" WriteMode
  let novo_valor = decrementaDinheiro quantidade valor
  hPutStr arq (show novo_valor)
  putStrLn "Compra realizada com sucesso"
  c <- getLine :: IO String --continuar
  hFlush arq 
  hClose arq


decrementaDinheiro :: Int -> Int -> Int
decrementaDinheiro quantidade valor = valor - (quantidade * 5)


verificaValor :: Int -> Int -> Bool
verificaValor quantidade dinheiro
  | ((quantidade * 5) - dinheiro <= 0) = True
  | otherwise = False


toInt :: String -> Int
toInt n = read n :: Int

