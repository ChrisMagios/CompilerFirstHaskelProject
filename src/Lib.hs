-- / Lib module for understanding basic haskell.
module Lib
    ( someFunc
    , square
    , ggT
    , extractIntegers
    ) where

-- / Puting example string to output.
someFunc :: IO ()
someFunc = putStrLn "Executing someFunc..."

-- / Calculate square of given number a
square  :: (Num a) => a -> a
square a = a * a

-- / Get the ggT from to Integers
ggT :: Integer -> Integer -> Integer
ggT a b = do
  if a >= b
    then do
      let x = (a `mod` b)
      if x == 0
        then b
        else ggT b x
    else ggT b a

extractIntegers :: Read a => String -> [a]
extractIntegers = map read . words