module Bafo
  ( bafo,
  )
where

import Util
import System.Exit
import System.Random 
import Text.Printf

bafo :: IO ()
bafo = do
  clearScr
  putStrLn "        =============================================      "
  putStrLn "             ██████╗  █████╗ ███████╗ ██████╗ "
  putStrLn "             ██╔══██╗██╔══██╗██╔════╝██╔═══██╗"
  putStrLn "             ██████╔╝███████║█████╗  ██║   ██║"
  putStrLn "             ██╔══██╗██╔══██║██╔══╝  ██║   ██║"
  putStrLn "             ██████╔╝██║  ██║██║     ╚██████╔╝"
  putStrLn "             ╚═════╝ ╚═╝  ╚═╝╚═╝      ╚═════╝ "
  putStrLn "        =============================================      "
  menuBafo

menuBafo :: IO ()
menuBafo = do
  putStrLn "                                              "
  putStrLn "                  1. APOSTAR FIGURINHAS       "
  putStrLn "                  2. MENU INICIAL             "
  putStrLn "                                              "
  entradaBafo


entradaBafo :: IO()
entradaBafo = do
  opc <- getLine :: IO String
  navegacaoBafo opc

navegacaoBafo :: String -> IO()
navegacaoBafo opc
  | opc == "1" = do
    apostar
  | opc == "2" = putStrLn " "
  | otherwise = do
    putStr "\nDigite uma opção válida\n"
    entradaBafo

apostar :: IO()
apostar = do
  putStrLn "                                                              "
  putStrLn " <<Digite a quantidade de figurinhas que deseja apostar>>     "
  putStrLn "                                                              "
  putStrLn " >> Quantidade:                                               "
  quantidade <- readLn :: IO Int
  if quantidade > 0 then validaAposta quantidade 
  else do putStrLn "Quantidade invalida"
  continuar

validaAposta:: Int -> IO()
validaAposta qtdJogador = do
  repetidas <- getInt "/src/arquivos/repetidas.txt"
  if (repetidas <= 0 || qtdJogador > repetidas) then
    mensagemSemRepetidas
  else do
    qtdBot <- quantidadeBot qtdJogador
    alteraArquivo "/src/arquivos/repetidas.txt" (repetidas - qtdJogador)
    figurinhasGanhas <- randomFig (apostaBafo (qtdBot + qtdJogador) 0)
    putStrLn "As Figurinhas ganhadas foram:"
    print $ show(figurinhasGanhas)
    putStrLn "Colando Figurinhas"
    marcarAlbum figurinhasGanhas
    putStrLn "As Figurinhas Foram Coladas"

quantidadeBot:: Int -> IO Int
quantidadeBot quantidadeJogador = do
  g <-  newStdGen
  let qtd = head (randomNumbers 1 quantidadeJogador g)
  return qtd

apostaBafo:: Int -> Int -> Int
apostaBafo qtdTotal qtdGanha = qtdTotal
--apostaBafo 0 qtdGanha = 0
--apostaBafo qtdTotal qtdGanha = do
--  batida 
--  g <-  newStdGen
--  let viradaJogador = head (randomNumbers 1 qtdTotal g)
--  printf "Viradas por você: %d \n" viradaJogador
--  let viradaBot = head (randomNumbers 1 (qtdTotal - viradaJogador) g)
--  print ("Viradas pelo bot:" ++ viradaBot ++ "\n")
--  apostaBafo 0 viradaJogador

  
batida:: IO()
batida = do
  putStrLn "Presione 'Enter' para bater figurinha"
  c <- getLine :: IO String
  putStrLn ""