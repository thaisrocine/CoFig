module Util
  ( clearScr,
    verificaRepetidas,
    mensagemSemRepetidas,
    addDinheiro,
  )
where

clearScr :: IO ()
clearScr = putStr "\ESC[2J"


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
  mensagemSemDinheiro
  valor <- readLn :: IO Int
  print $ valor
  putStrLn "Adicionando dinheiro ao arquivo"