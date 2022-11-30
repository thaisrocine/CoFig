module Album
  ( album,
  )
where

import Util
import Text.Printf

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
  putStrLn  "                                                          "
  putStrLn  "---------------  ESTATÍSTICAS ----------------------------"
  conteudo <- lerArquivo "/src/arquivos/album.txt"
  putStrLn  "        ----Quantidade de Figurinhas coladas---        "
  let quantidadeColadas = contaVerdadeiros conteudo
  printf "%.0f \n" quantidadeColadas
  putStrLn "                                                        "
  putStrLn "        ----Quantidade de Figurinhas faltantes---       "
  print(contaFalsos conteudo)
  putStrLn "                                                        "
  putStrLn "        ----Porcentagem figurinhas no álbum (%)---      "
  printf "%.2f \n" ((quantidadeColadas / 250.0)* 100)
  putStrLn ""
  continuar


contaVerdadeiros :: [String] -> Double
contaVerdadeiros [] = 0
contaVerdadeiros (a:as) = do
  if a == "True" then 1.0 + contaVerdadeiros as
  else 0.0 + contaVerdadeiros as

contaFalsos :: [String] -> Int
contaFalsos st = length ([s | s <- st,last (reverseString s) == 'F'])

reverseString :: [Char] -> [Char]
reverseString [] = []
reverseString (x:xs) = reverseString xs ++ [x]