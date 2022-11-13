
module ReceberDadosUser
  ( escreverDados,
  )
where

import Util
import System.IO

escreverDados :: IO ()
escreverDados = do
                arq<-openFile "Dados.txt" AppendMode
                
                putStrLn "Digite seu nome: "
                nome<- getLine
                
                hPutStr arq ("Nome do Dono do album: "++ nome)
                putStrLn ("Nome do Dono do album: "++ nome)
                
                putStrLn "Digite a quantidade de dinheiro inicial: "
                qtdDinheiro<- getLine
                
                hPutStr arq ("Dinheiro de: "++ nome ++ " R$" ++ qtdDinheiro)
                putStrLn (nome ++ " Possui: " ++ qtdDinheiro ++ " Reais")
                
                hFlush arq 
                hClose arq
