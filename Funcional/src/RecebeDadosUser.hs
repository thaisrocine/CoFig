
module RecebeDadosUser
  ( escreverDados,
  )
where

import Util
import System.IO
import System.Random 
import Language.Haskell.TH (arithSeqE)
import Text.Printf (printf)

escreverDados :: IO ()
escreverDados = do
                arq<-openFile "Dados.txt" AppendMode
                
                putStrLn "Digite seu nome: "
                nome<- getLine
                
                hPutStr arq ("Nome do Dono do album: "++ nome++"\n")
                putStrLn ("Nome do Dono do album: "++ nome)
                
                putStrLn "Digite a quantidade de dinheiro inicial: "
                qtdDinheiro<- getLine
                
                hPutStr arq ("Dinheiro de "++ nome ++ ": R$" ++ qtdDinheiro++"\n")
                putStrLn (nome ++ " Possui: " ++ qtdDinheiro ++ " Reais")
            
                
                hFlush arq 
                hClose arq

randomFig :: Int -> Int ->StdGen-> IO()
randomFig quantFig quantMaxFig g = print $ take quantFig (randomRs (1,quantMaxFig::Int) g)


main:: IO()
main = do
    qFig <- readLn:: IO Int
    qMaxFig <- readLn:: IO Int
    g <-  newStdGen
    randomFig qFig qMaxFig g
    arq <- openFile "figurinhas.csv" AppendMode
    hPutStr arq (show (take qFig (randomRs (1, qMaxFig::Int) g)) ++ "\n")
    hFlush arq 
    hClose arq



