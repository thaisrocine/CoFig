
module RecebeDadosUser
  ( escreverDados,
  )
where

import Util
import System.IO
import System.Random 

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
            putStrLn ("Quer continuar comprando digite 1 ")
            f <- randomRIO (1,250::Int)
            putStrLn ("Fig aleatória obtida " ++ show f)
            comprar <- getLine :: IO String
            
            if comprar == "1"
              then randomFig
    
    
            else
              putStrLn ("Digite opcao valida ")

        




