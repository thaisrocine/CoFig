module Util
  ( clearScr,
    verificaQuantidadeRepetidas,
    mensagemSemDinheiro,
    mensagemSemDinheiroSemRepetidas,
    mensagemSemRepetidas,
    mensagemTemRepetidas,
    toInt,
    verificaValor,
    alteraArquivo,
    lerArquivo,
    continuar,
    acrescentaDinheiro,
    getInt,
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



verificaRepetidasEDinheiro:: IO()
verificaRepetidasEDinheiro = do
  dinheiro <- getInt "/src/arquivos/dinheiro.txt"
  repetidas <- getInt "/src/arquivos/repetidas.txt"
  if dinheiro <= 0 && repetidas <= 0 then do
    mensagemSemDinheiroSemRepetidas
    acrescentaDinheiro
  else putStrLn ""

acrescentaDinheiro :: IO()
acrescentaDinheiro = do
  valor <- getInt "/src/arquivos/dinheiro.txt"
  acrescimo <- readLn :: IO Int
  alteraArquivo ("/src/arquivos/dinheiro.txt") (acrescimo + valor)

mensagemTemRepetidas :: IO()
mensagemTemRepetidas = do
  putStrLn "                                                                "
  putStrLn "         <<Você ainda possui figurinhas repetidas>>             "
  putStrLn "    <<Você pode vendê-las para conseguir mais dinheiro>>        "
  putStrLn "                                                                "

mensagemSemDinheiroSemRepetidas :: IO()
mensagemSemDinheiroSemRepetidas = do
  putStrLn "                                                                                      "
  putStrLn "      <<Que pena, parece que você está sem dinhero e sem figurinhas repetidas>>       "
  putStrLn "                     <<Para continuar jogando insira um valor>>                       "
  putStrLn "                                                                                      "
  putStrLn " >> Valor:                                                                            "


mensagemSemDinheiro :: IO()
mensagemSemDinheiro = do
  putStrLn "                                                                       "
  putStrLn "      <<Que pena, parece que você não possui dinhero suficente>>       "
  putStrLn " <<Para continuar venda figurinhas repetidas para conseguir dinheiro>> "
  putStrLn "                                                                       "


mensagemSemRepetidas :: IO()
mensagemSemRepetidas = do
  putStrLn "                                                                "
  putStrLn "      <<Parece que você está sem figurinhas repetidas>          "
  putStrLn "   <<Volte quando tiver pelo menos uma para poder vender>>      "
  putStrLn "                                                                "


verificaQuantidadeRepetidas :: Int -> Bool
verificaQuantidadeRepetidas 0 = False
verificaQuantidadeRepetidas repetidas = True


alteraArquivo :: String -> Int -> IO()
alteraArquivo arquivo novo_valor = do
  exedir <- getCurrentDirectory
  arq <- openFile (exedir ++ arquivo) WriteMode
  hPutStr arq (show novo_valor)
  hFlush arq
  hClose arq

continuar:: IO()
continuar = do 
  putStrLn "Presione 'Enter' para continuar"
  c <- getLine :: IO String
  putStrLn ""

lerArquivo :: String -> IO [String]
lerArquivo arquivo = do
  exedir <- getCurrentDirectory
  arquivo <- openFile (exedir ++ arquivo) ReadMode
  conteudo <- S.hGetContents arquivo
  return $ lines conteudo


getInt :: String -> IO Int
getInt arquivo = do
  conteudo <- lerArquivo arquivo
  let valor = toInt (head conteudo)
  return $ valor