import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

addSquareSum :: Integer
addSquareSum =
    let oddSquares = filter odd $ map (^2) [1..]
        belowLimit = takeWhile(<10000) oddSquares
    in sum belowLimit

main :: IO()
main = hspec $ do
    describe "Function composition" $ do
        it "can take the absolute value and negate that" $ do
            pending
            {- change this to function composiation -}
            {- (map (\x -> negate (abs x)) [1,2,-3,4,5]) -}
            {- [0]  `shouldBe` [-1,-2,-3,-4,-5] -}
        it "can compose a new function from 3 other functions" $ do
            pending
            {- negate sum and get the last element -}
            {- [[1..5],[3..6],[1..7]] -}
                {- `shouldBe` [-14,-15,-27] -}
        it "can calculate the sum of all odd squares <10000" $ do
            pending
            {- 0 `shouldBe` 166650 -}
            {- A more readable version -}
            {- addSquareSum `shouldBe` 166650 -}

