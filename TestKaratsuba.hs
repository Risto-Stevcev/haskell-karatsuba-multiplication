import Test.HUnit
import Karatsuba

test_1234_5678 = TestCase (assertEqual "karatsuba 1234 5678 == 7006652" 
  7006652 (karatsuba 1234 5678))
test_1234_0 = TestCase (assertEqual "karatsuba 1234 0 == 0" 
  0 (karatsuba 1234 0))
test_n223_33 = TestCase (assertEqual "karatsuba (-223) 33 == -7359" 
  (-7359) (karatsuba (-223) 33))
test_n223_n1237 = TestCase (assertEqual "karatsuba (-223) (-1237) == 275851" 
  275851 (karatsuba (-223) (-1237)))

tests = 
  TestList [TestLabel "test_5678_1234" test_1234_5678,
            TestLabel "test_5678_1234" test_1234_0,
            TestLabel "test_n223_33" test_n223_33, 
            TestLabel "test_n223_n1237" test_n223_n1237]

main = runTestTT tests
