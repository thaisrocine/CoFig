module Menu
  ( run,
    menu,
  )
where

import Album
import Loja
import Bafo
import System.Exit
import Text.Printf
import Util


run :: IO()
run = do
  logo
  mensagemInicial


logo :: IO ()
logo = do
  clearScr
  putStrLn "        =============================================      "
  putStrLn "              ██████╗ ██████╗ ███████╗██╗ ██████╗          "
  putStrLn "             ██╔════╝██╔═══██╗██╔════╝██║██╔════╝          "
  putStrLn "             ██║     ██║   ██║█████╗  ██║██║  ███╗         "
  putStrLn "             ██║     ██║   ██║██╔══╝  ██║██║   ██║         "
  putStrLn "             ╚██████╗╚██████╔╝██║     ██║╚██████╔╝         "
  putStrLn "              ╚═════╝ ╚═════╝ ╚═╝     ╚═╝ ╚═════╝          "
  putStrLn "        =============================================      "

mensagemInicial :: IO ()
mensagemInicial = do
  putStrLn "                                                                "
  putStrLn "  <<Seja bem vindo ao seu simulador de Álbum da Copa do Mundo>> "
  putStrLn "                       <<Deseja iniciar?>>                      "
  putStrLn "                              1.SIM                             "
  putStrLn "                              2.NÃO                             "
  putStrLn "                                                                "
  entradaIniciaJogo

menu :: IO ()
menu = do
  clearScr
  putStrLn "        ================================================      "
  putStrLn "             ███╗   ███╗███████╗███╗   ██╗██╗   ██╗           "
  putStrLn "             ████╗ ████║██╔════╝████╗  ██║██║   ██║           "
  putStrLn "             ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║           "
  putStrLn "             ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║           "
  putStrLn "             ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝           "
  putStrLn "             ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝            "
  putStrLn "        ================================================      "
  menuPrincipal

menuPrincipal :: IO ()
menuPrincipal = do
  conteudo <- lerArquivo "/src/arquivos/album.csv"
  estaCompleto conteudo
  putStrLn "                                               "
  putStrLn "                             1. ALBUM          "
  putStrLn "                             2. LOJA           "
  putStrLn "                             3. BAFO           "
  putStrLn "                             4. FINALIZAR      "
  putStrLn "                                               "
  entradaMenuPrincipal


entradaMenuPrincipal :: IO()
entradaMenuPrincipal = do
  opc <- getLine :: IO String
  navegacaoMenu opc

navegacaoMenu :: String -> IO()
navegacaoMenu opc
  | opc == "1" = do 
    album
    menu
  | opc == "2" = do 
    loja
    menu
  | opc == "3" = do 
    bafo
    menu
  | opc == "4" = exitSuccess
  | otherwise = do
    putStrLn "\nDigite uma opção válida\n"
    entradaMenuPrincipal


entradaIniciaJogo :: IO()
entradaIniciaJogo = do
  opc <- getLine :: IO String
  navegacaoIniciar opc


navegacaoIniciar :: String -> IO()
navegacaoIniciar opc
  | opc == "1" = menu
  | opc == "2" = exitSuccess
  | otherwise = do
    putStrLn "\nDigite uma opção válida\n"
    entradaIniciaJogo
          
estaCompleto:: [String] -> IO()
estaCompleto [] = do 
  putStr "\nParabéns você completou o álbum\nObrigado por jogar\n"
  exitSuccess
estaCompleto (a:as) = if a == "True" then estaCompleto as
  else putStrLn ""