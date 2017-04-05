import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

{-
   Create a Person record with 3 fields
   * firstName
   * lastName
   * age
-}

{- mikeD Michael Diamong 43 -}
mikeD :: Person

{- adRock Adam Horobitz 41 -}
adRock :: Person

{- mca Adam Yauch 44 -}
mca :: Person

main :: IO()
main = hspec $ do
    describe "Person" $ do
        it "can compare two fields" $ do
            mca == adRock `shouldBe` False
            mikeD == adRock `shouldBe` False
            mikeD /= adRock `shouldBe` True
            mikeD == mikeD `shouldBe` True
            mikeD == Person {firstName="Michael",lastName="Diamond",age=43}
                `shouldBe` True
        it "will work with `elem` as Person is in Eq" $ do
            let beastieBoys = [mca, adRock, mikeD]
            (mikeD `elem` beastieBoys) `shouldBe` True
        it "is is now an instance of Show" $ do
            "mikeD is: " ++ show mikeD
                `shouldBe` "mikeD is: Person {firstName = \"Michael\", lastName = \"Diamond\", age = 43}"
        it "is is now an instance of Read" $ do
            (firstName $ (read "Person {firstName=\"Michael\",lastName=\"Diamond\",age=43}" :: Person))
                `shouldBe` "Michael"
        it "can infer the type, no type annotation is needed" $ do
            read "Person {firstName=\"Michael\",lastName=\"Diamond\",age=43}" == mikeD
                `shouldBe` True
