module Bafo
  ( bafo,
  )
where

import Util
import System.Exit

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
    putStrLn "Apostando"
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
  putStrLn "APOSTANDO FIGURINHAS"
  continua <- getLine :: IO String
  putStrLn ""

