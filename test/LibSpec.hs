{-# LANGUAGE ScopedTypeVariables #-}
module LibSpec (spec) where

import  Lib (square, ggT)
import  Test.Hspec
import  Test.QuickCheck

check :: Integer -> Integer -> Bool
check n k = do
    if n >= 0 && k >= 0
        then True
        else False


spec :: Spec
spec = do
    describe "Testing lib.hs function: square" $ do
        it "calculates the square of 5.3" $
            square 5.3 `shouldBe` (28.09 :: Double)
        it "calculates the square of an arbitrary integer" $
            property $ \(n :: Integer) -> square n == n * n
        it "calculates the square of an arbitrary double" $
            property $ \(n :: Double) -> square n == n * n
    describe "Testing lib.hs function: ggT" $ do
        it "calculates the ggT of 3780 and 3528" $
            ggT 3780 3528 `shouldBe` 252
        it "calculate the ggT for relatively prime numbers 45 and 32" $
            ggT 45 32 `shouldBe` 1
        it "Compares values of lib function ggT with Haskells gcd" $
            property $ \ n k -> (check n k) ==> ggT n k == gcd n k
