module Util
  ( clearScr,
  )
where

clearScr :: IO ()
clearScr = putStr "\ESC[2J"
