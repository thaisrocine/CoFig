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

mensagemVender :: IO()
mensagemVender = do
  putStrLn "                                                              "
  putStrLn " <<Digite a quantidade de figurinhas que você deseja vender>> "
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
  repetidas <- getInt "/src/arquivos/repetidas.txt"
  mensagemVender
  quantidade <- readLn :: IO Int
  if quantidade > 0 then validacaoVenda quantidade repetidas
  else putStrLn "Quantidade invalida"


validacaoVenda :: Int -> Int -> IO()
validacaoVenda quantidade repetidas
  | verificaQuantidadeRepetidas repetidas = realizaVenda quantidade repetidas
  | otherwise = do 
    mensagemSemRepetidas
    continuar

realizaVenda:: Int -> Int -> IO()
realizaVenda quantidade repetidas = do
  dinheiro <- getInt "/src/arquivos/dinheiro.txt"
  let novo_valor = incrementaDinheiro quantidade dinheiro
  alteraArquivo "/src/arquivos/dinheiro.txt" novo_valor
  alteraArquivo "/src/arquivos/repetidas.txt" (repetidas - quantidade)
  putStrLn "Venda realizada com sucesso"
  continuar


compra :: IO()
compra = do
  valor <- getInt "/src/arquivos/dinheiro.txt"
  repetidas <- getInt "/src/arquivos/repetidas.txt"
  mensagemCompra
  quantidade <- readLn :: IO Int
  if quantidade > 0 then validacaoCompra quantidade valor repetidas
  else putStrLn "Quantidade invalida"

validacaoCompra :: Int -> Int -> Int -> IO()
validacaoCompra qtdeCompra dinheiro repetidas
  | dinheiro < 1 && repetidas < 1 = do
    mensagemSemDinheiroSemRepetidas
    acrescentaDinheiro
  | verificaValor qtdeCompra dinheiro = realizaCompra qtdeCompra dinheiro
  | verificaQuantidadeRepetidas repetidas = do 
    mensagemTemRepetidas
    c <- getLine :: IO String
    putStrLn ""
  | otherwise = do
    mensagemSemDinheiro
    continuar

realizaCompra :: Int -> Int -> IO()
realizaCompra quantidade valor = do
  let novo_valor = decrementaDinheiro quantidade valor
  alteraArquivo "/src/arquivos/dinheiro.txt" novo_valor
  randomFig quantidade
  putStrLn "Compra realizada com sucesso"
  continuar

decrementaDinheiro :: Int -> Int -> Int
decrementaDinheiro quantidade valor = valor - (quantidade * 5)

incrementaDinheiro :: Int -> Int -> Int
incrementaDinheiro quantidade valor = valor + quantidade

randomNumbers :: Int -> Int ->StdGen-> IO()
randomNumbers quantFig quantMaxFig g = print $ take quantFig (randomRs (1,quantMaxFig::Int) g)

randomFig:: Int->IO()
randomFig quant = do
    g <-  newStdGen
    randomNumbers (quant*5) 250 g