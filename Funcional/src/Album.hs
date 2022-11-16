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
  navegacao

navegacao :: IO ()
navegacao = do
  nav <- getLine :: IO String
  if nav == "1"
    then print "ESTATISTICAS"
    else
      if nav == "2"
        then putStrLn ""
        else do
            putStr "\nDigite uma opção válida\n"
            navegacao