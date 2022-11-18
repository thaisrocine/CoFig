module Menu
  ( logo,
    mensagemInicial,
    iniciaJogo,
  )
where

import Album
import Loja
import Bafo
import RecebeDadosUser
import System.Exit
import Text.Printf
import Util

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

menu :: IO ()
menu = do
  putStrLn "        ================================================      "
  putStrLn "             ███╗   ███╗███████╗███╗   ██╗██╗   ██╗           "
  putStrLn "             ████╗ ████║██╔════╝████╗  ██║██║   ██║           "
  putStrLn "             ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║           "
  putStrLn "             ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║           "
  putStrLn "             ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝           "
  putStrLn "             ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝            "
  putStrLn "        ================================================      "

menuPrincipal :: IO ()
menuPrincipal = do
  estaCompleto [False]
  menu
  putStrLn "                                               "
  putStrLn "                             1. ALBUM          "
  putStrLn "                             2. LOJA           "
  putStrLn "                             3. BAFO           "
  putStrLn "                             4. FINALIZAR      "
  putStrLn "                                               "
  navegacao

navegacao :: IO ()
navegacao = do
  nav <- getLine :: IO String
  if nav == "1"
    then do
      album
    else
      if nav == "2"
        then loja
        else
          if nav == "3"
            then do bafo
            else
              if nav == "4" then exitSuccess
              else do
              putStr "\nDigite uma opção válida\n"
              navegacao
  menuPrincipal

iniciaJogo :: IO()
iniciaJogo = do
  opc <- getLine :: IO String
  if opc == "1"
    then do
      menuPrincipal
    else
      if opc == "2"
        then exitSuccess
        else do
          putStr "\nDigite uma opção válida\n"
          iniciaJogo

          
estaCompleto:: [Bool] -> IO()
estaCompleto [] = do 
  putStr "\nParabéns você completou o álbum\nObrigado por jogar\n"
  exitSuccess
estaCompleto (a:as) = if a == True then estaCompleto as
  else putStrLn ""