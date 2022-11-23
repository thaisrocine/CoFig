module Util
  ( clearScr,
    verificaQuantidadeRepetidas,
    mensagemSemDinheiro,
    mensagemSemRepetidas,
    mensagemTemRepetidas,
    toInt,
    verificaValor,
    alteraDinheiro,
    lerArquivo,
  )
where

import System.IO
import System.Directory
import System.IO.Strict as S



clearScr :: IO ()
clearScr = putStr "\ESC[2J"

toInt :: String -> Int
toInt n = read n :: Int

verificaValor :: Int -> Int -> Bool
verificaValor quantidade dinheiro
  | ((quantidade * 5) - dinheiro <= 0) = True
  | otherwise = False



mensagemTemRepetidas :: IO()
mensagemTemRepetidas = do
  putStrLn "                                                                "
  putStrLn "         <<Você ainda possui figurinhas repetidas>>             "
  putStrLn "    <<Você pode vendê-las para conseguir mais dinheiro>>        "
  putStrLn "                                                                "

mensagemSemDinheiro :: IO()
mensagemSemDinheiro = do
  putStrLn "                                                                                      "
  putStrLn "      <<Que pena, parece que você está sem dinhero e sem figurinhas repetidas>>       "
  putStrLn "                     <<Para continuar jogando insira um valor>>                       "
  putStrLn "                                                                                      "
  putStrLn " >> Valor:                                                                            "


mensagemSemRepetidas :: IO()
mensagemSemRepetidas = do
  putStrLn "                                                                "
  putStrLn "      <<Parece que você está sem figurinhas repetidas>          "
  putStrLn "   <<Volte quando tiver pelo menos uma para poder vender>>      "
  putStrLn "                                                                "


verificaQuantidadeRepetidas :: Int -> Bool
verificaQuantidadeRepetidas 0 = False
verificaQuantidadeRepetidas repetidas = True


alteraDinheiro :: Int -> IO()
alteraDinheiro novo_valor = do
  exedir <- getCurrentDirectory
  arq <- openFile (exedir ++ "/src/arquivos/dinheiro.txt") WriteMode
  hPutStr arq (show novo_valor)
  hFlush arq
  hClose arq


lerArquivo :: String -> IO [String]
lerArquivo arquivo = do
  exedir <- getCurrentDirectory
  arquivo <- openFile (exedir ++ arquivo) ReadMode
  conteudo <- S.hGetContents arquivo
  return $ lines conteudo