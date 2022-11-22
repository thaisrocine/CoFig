module Album
  ( album,
  )
where

import Util

album :: IO ()
album = do
  clearScr
  putStrLn "          ======================================================      "
  putStrLn "                █████╗ ██╗     ██████╗ ██╗   ██╗███╗   ███╗           "
  putStrLn "               ██╔══██╗██║     ██╔══██╗██║   ██║████╗ ████║           "
  putStrLn "               ███████║██║     ██████╔╝██║   ██║██╔████╔██║           "
  putStrLn "               ██╔══██║██║     ██╔══██╗██║   ██║██║╚██╔╝██║           "
  putStrLn "               ██║  ██║███████╗██████╔╝╚██████╔╝██║ ╚═╝ ██║           "
  putStrLn "               ╚═╝  ╚═╝╚══════╝╚═════╝  ╚═════╝ ╚═╝     ╚═╝           "
  putStrLn "          ======================================================      "
  menuAlbum

menuAlbum :: IO ()
menuAlbum = do
  putStrLn "                                                            "
  putStrLn "                           1. ESTATISTICAS                  "
  putStrLn "                           2. MENU INICIAL                  "
  putStrLn "                                                            "
  entradaAlbum

entradaAlbum :: IO()
entradaAlbum = do
  opc <- getLine :: IO String
  navegacaoAlbum opc


navegacaoAlbum :: String -> IO()
navegacaoAlbum opc
  | opc == "1" = putStrLn "ESTATISTICA"
  | opc == "2" = putStrLn ""
  | otherwise = do
    putStr "\nDigite uma opção válida\n"
    entradaAlbum

