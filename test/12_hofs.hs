import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

divideByTen :: (Fractional a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

main :: IO()
main = hspec $ do
    describe "Higher Order Functions" $ do
        it "can copare it with 100" $ do
            compareWithHundred 100 `shouldBe` EQ
        it "can divide by 10 with partial function" $ do
            divideByTen 200 `shouldBe` 20.0
        it "can tell if upper-case letter" $ do
            isUpperAlphanum 'b' `shouldBe` False
            isUpperAlphanum 'B' `shouldBe` True
        it "can apply a function twice" $ do
            applyTwice (+3) 10 `shouldBe` 16
            applyTwice (++ " HAHA") "HEY" `shouldBe` "HEY HAHA HAHA"
        it "can zip with a function" $ do
            zipWith' (+) [1,2,3] [4,5,6] `shouldBe` [5,7,9]
            zipWith' (*) [1,2,3] [4,5,6] `shouldBe` [4,10,18]
            zipWith' max [1,2,3] [2,1,3] `shouldBe` [2,2,3]

