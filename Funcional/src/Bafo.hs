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
  | opc == "1" = putStrLn "Apostando"
  | opc == "2" = putStrLn " "
  | otherwise = do
    putStr "\nDigite uma opção válida\n"
    entradaBafo
