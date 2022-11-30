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
    putStrLn ""
    printf "Quantidade apostada pelo bot: %d \n" qtdBot
    putStrLn ""
    alteraArquivo "/src/arquivos/repetidas.txt" (repetidas - qtdJogador)
    qtdFigurinhas <- apostaBafo (qtdBot + qtdJogador)
    figurinhasGanhas <- randomFig qtdFigurinhas
    putStrLn ""
    putStrLn "As Figurinhas ganhas por você foram:"
    print $ show(figurinhasGanhas)
    putStrLn "Colando Figurinhas"
    marcarAlbum figurinhasGanhas
    putStrLn "As Figurinhas Foram Coladas"
    putStrLn ""

quantidadeBot:: Int -> IO Int
quantidadeBot quantidadeJogador = do
  g <-  newStdGen
  let qtd = head (randomNumbers 1 quantidadeJogador g)
  return qtd

apostaBafo:: Int -> IO Int
apostaBafo 0 = return 0
apostaBafo qtdTotal = do
  batida 
  gJ <-  newStdGen
  let viradaJogador = head (randomNumbers 1 qtdTotal gJ)
  printf "Quantidade de figurinhas viradas por você: %d \n" viradaJogador
  let qtdTotalAtual = qtdTotal - viradaJogador
  if qtdTotalAtual > 0 then do
    gB <-  newStdGen
    let viradaBot = head (randomNumbers 1 qtdTotalAtual gB)
    printf "Quantidade de figurinhas viradas pelo Bot: %d \n" viradaBot
    let qtdTotalFinal = qtdTotalAtual - viradaBot
    printf "Figurinhas perdidas por você e o bot: %d \n" qtdTotalFinal
    return viradaJogador
  else return viradaJogador
  
batida:: IO()
batida = do
  putStrLn "Presione 'Enter' para bater figurinha"
  c <- getLine :: IO String
  putStr ""