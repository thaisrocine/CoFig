import Text.Printf
import System.Exit

main :: IO()
main = do
  printf "CoFig \nSeja bem vindo ao seu simulador de album de figurinhas \nDeseja iniciar?(s/n)\n"

  iniciaJogo

iniciaJogo:: IO()
iniciaJogo = do
  opc <- getLine
  if opc == "s" then printf "Iniciado" 
  else if opc == "n" then exitSuccess 
    else main
