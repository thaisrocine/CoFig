module Loja
  (loja,
  )
where

import System.IO
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
  continuar


validacaoVenda :: Int -> Int -> IO()
validacaoVenda quantidade repetidas
  | verificaQuantidadeRepetidas repetidas && quantidade < repetidas = realizaVenda quantidade repetidas
  | otherwise = mensagemSemRepetidas

realizaVenda:: Int -> Int -> IO()
realizaVenda quantidade repetidas = do
  dinheiro <- getInt "/src/arquivos/dinheiro.txt"
  let novo_valor = incrementaDinheiro quantidade dinheiro
  alteraArquivo "/src/arquivos/dinheiro.txt" novo_valor
  alteraArquivo "/src/arquivos/repetidas.txt" (repetidas - quantidade)
  putStrLn "Venda realizada com sucesso"


compra :: IO()
compra = do
  valor <- getInt "/src/arquivos/dinheiro.txt"
  repetidas <- getInt "/src/arquivos/repetidas.txt"
  mensagemCompra
  quantidade <- readLn :: IO Int
  if quantidade > 0 then validacaoCompra quantidade valor repetidas
  else do putStrLn "Quantidade invalida"
  continuar

validacaoCompra :: Int -> Int -> Int -> IO()
validacaoCompra qtdeCompra dinheiro repetidas
  | verificaValor qtdeCompra dinheiro = realizaCompra qtdeCompra dinheiro
  | verificaQuantidadeRepetidas repetidas = do 
    mensagemTemRepetidas
    continuar
  | otherwise = do
    mensagemSemDinheiro

realizaCompra :: Int -> Int -> IO()
realizaCompra quantidade valor = do
  decrementaDinheiro quantidade valor
  figurinhas <- randomFig quantidade
  marcarAlbum figurinhas
  print $ show(figurinhas)
  putStrLn "Compra realizada com sucesso"

decrementaDinheiro :: Int -> Int -> IO()
decrementaDinheiro quantidade valor = alteraArquivo "/src/arquivos/dinheiro.txt"(valor - (quantidade * 5))

incrementaDinheiro :: Int -> Int -> Int
incrementaDinheiro quantidade valor = valor + quantidade