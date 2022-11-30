module Bafo
  ( bafo,
  )
where

import Util
import System.Exit
import System.Random 

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
validaAposta quantidade = do
  repetidas <- getInt "/src/arquivos/repetidas.txt"
  if repetidas <= 0 || quantidade > repetidas then mensagemSemRepetidas
  else putStrLn "" 
--    qtdBot <- apostaBot
--    print $ show(qtdBot)

--apostaBot:: Int -> IO [Int]
--apostaBot quantidadeJogador = do
--  g <-  newStdGen
--  let qtd = take 1 (randomNumbers 1 quantidadeJogador g)
--  return qtd