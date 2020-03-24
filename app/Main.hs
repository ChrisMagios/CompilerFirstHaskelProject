module Main where

import Lib
import System.IO (BufferMode (NoBuffering), hSetBuffering, stdout)


{-# LANGUAGE BlockArguments #-}
main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Geben Sie bitte zwei Zahl ein (0 == Ende): "
  inputNumbers <- getLine
  let [number1, number2] = extractIntegers inputNumbers :: [Integer] in do
    if number1 == 0
      then putStrLn "Exiting..."
      else do
        putStrLn ("ggT("++ show number1 ++"," ++ show number2 ++") = " ++ show (ggT number1 number2))
        main
