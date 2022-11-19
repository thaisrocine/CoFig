module Loja
  (loja,
  )
where
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
  navegacao

navegacao :: IO ()
navegacao = do
  nav <- getLine :: IO String
  if nav == "1"
    then do
      if (verificaDinheiro 1) 
        then
          putStrLn "COMPRANDO"
        else 
          addDinheiro
    else if nav == "2" 
      then do
        if (verificaRepetidas 1)
          then
            putStrLn "VENDENDO"
          else
            mensagemSemRepetidas
      else if nav == "3" 
        then 
          putStrLn ""
        else do
          putStr "\nDigite uma opção válida\n"
          navegacao