
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

randomFig :: IO ()
randomFig = do 
            x <- readLn :: IO Int
            g <- newStdGen
            print $ take x (randomRs (1, 250::Int) g)
            arq <- openFile "figurinhas.csv" AppendMode

            hPutStr arq (show (take x (randomRs (1, 250::Int) g)) ++ "\n")
            hFlush arq 
            hClose arq
            




