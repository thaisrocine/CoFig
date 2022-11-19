
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
            putStrLn ("Digite a quantidade de figurinhas")

            quantFig <- readLn :: IO Int
            putStrLn ("Digite a quantidade limite de figurinhas aleatorias possíveis")
            quantMaxFig <- readLn :: IO Int
            g <- newStdGen
            print $ take quantFig (randomRs (1,quantMaxFig::Int) g)
            arq <- openFile "figurinhas.csv" AppendMode

            hPutStr arq (show (take quantFig (randomRs (1, quantMaxFig::Int) g)) ++ "\n")
            hFlush arq 
            hClose arq
            
            putStrLn("Quer continuar comprando digite 1")
            comprar <- getLine :: IO String

            if comprar == "1"
              then randomFig


            else
              putStrLn ("Digite opcao valida ")