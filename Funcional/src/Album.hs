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
  | opc == "1" = estatisticas
  | opc == "2" = putStrLn ""
  | otherwise = do
    putStr "\nDigite uma opção válida\n"
    entradaAlbum


estatisticas :: IO()
estatisticas = do
  putStrLn  "---------------  ESTATÍSTICAS ----------------------------"
  conteudo <- lerArquivo "/src/arquivos/album.csv"
  putStrLn  "      ----Quantidade de Figurinhas coladas---     "
  print(contaVerdadeiros conteudo)
  putStrLn "       ----------------------    "
  putStrLn "       ----Quantidade de Figurinhas faltantes---    "
  print(contaFalsos conteudo)
  putStrLn "       ----------------------    "
  putStrLn "       ----Porcentagem figurinhas no álbum (%)---    "
  let quantidadeColadas = contaVerdadeiros conteudo
  print(quantidadeColadas `div` 250)
  print(conteudo, "%")
 



contaVerdadeiros :: [String] -> Int
contaVerdadeiros st = length ([s | s <- st,last (reverseString s) == 'T'])

contaFalsos :: [String] -> Int
contaFalsos st = length ([s | s <- st,last (reverseString s) == 'F'])

reverseString :: [Char] -> [Char]
reverseString [] = []
reverseString (x:xs) = reverseString xs ++ [x]