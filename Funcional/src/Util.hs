module Util
  ( clearScr,
    verificaRepetidas,
    mensagemSemDinheiro,
    mensagemSemRepetidas,
    toInt,
    verificaValor,
    alteraDinheiro,
    addDinheiro,
  )
where

import System.IO
import System.Directory


clearScr :: IO ()
clearScr = putStr "\ESC[2J"

toInt :: String -> Int
toInt n = read n :: Int

verificaValor :: Int -> Int -> Bool
verificaValor quantidade dinheiro
  | ((quantidade * 5) - dinheiro <= 0) = True
  | otherwise = False


mensagemSemDinheiro :: IO()
mensagemSemDinheiro = do
  putStrLn "                                                                "
  putStrLn "      <<Que pena, parece que você está sem dinhero>>            "
  putStrLn "        <<Para continuar jogando insira um valor>>              "
  putStrLn "                                                                "
  putStrLn " >> Valor:                                                      "


mensagemSemRepetidas :: IO()
mensagemSemRepetidas = do
  putStrLn "                                                                "
  putStrLn "      <<Parece que você está sem figurinhas repetidas>          "
  putStrLn "   <<Volte quando tiver pelo menos uma para poder vender>>      "
  putStrLn "                                                                "


verificaRepetidas :: Int -> Bool
verificaRepetidas 0 = False
verificaRepetidas repetidas = True


addDinheiro :: IO()
addDinheiro = do
  valor <- readLn :: IO Int
  print $ valor
  putStrLn "Adicionando dinheiro ao arquivo"


alteraDinheiro :: Int -> IO()
alteraDinheiro novo_valor = do
  exedir <- getCurrentDirectory
  arq <- openFile (exedir ++ "/src/arquivos/dinheiro.txt") WriteMode
  hPutStr arq (show novo_valor)
  hFlush arq
  hClose arq

